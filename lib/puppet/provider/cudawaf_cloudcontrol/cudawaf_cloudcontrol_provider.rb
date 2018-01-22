require_relative '../../../puppet_x/modules/login_info'
require File.join(File.dirname(__FILE__), '../cudawaf')

require 'json'
require 'base64'
require 'uri'
require 'logger'
require 'rest-client'

Puppet::Type.type(:cudawaf_cloudcontrol).provide(:cudawaf_cloudcontrol_provider, parent: Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  def exists?
    Puppet.debug(self.class.to_s.split('::').last + ': Calling exists method : ')
    @property_hash[:ensure] == :present
    true
  end

  def self.instances
    Puppet.debug(to_s.split('::').last + ': Calling self instances method : ')
    instances = []

    response = Puppet::Provider::Cudawaf.client_get '/control-center'
    cntrlObj = response['data']
    Puppet.debug(to_s.split('::').last + ": Response for GET cloud-control API:  #{cntrlObj}")

    instances << new(
      ensure: :present,
      state: cntrlObj['state'],
      connect_mode: 'cloud',
      username: cntrlObj['username']
    )

    instances
  end

  def self.prefetch(resources)
    Puppet.debug(to_s.split('::').last + ': Calling self.prefetch method : ')

    cloudobj = instances
    resources.keys.each do |state|
      if provider = cloudobj.find { |cloud| cloud.state == state }
        resources[state].provider = provider
      end
    end
  end

  def flush
    Puppet.debug(self.class.to_s.split('::').last + ': Calling flush method : ')

    if @property_hash != {}
      postdata = {
        'connect_mode' => @resource['connect_mode'],
        'state' => @resource['state']
      }

      if postdata['state'].to_s == 'connected'
        postdata[:username] = @resource['username']
        postdata[:password] = @resource['password']
      end

      response = Puppet::Provider::Cudawaf.client_put '/control-center', postdata.to_json
      Puppet.debug(self.class.to_s.split('::').last + ": Response from PUT cloud-control API:  #{response}")
    end

    response
  end
end
