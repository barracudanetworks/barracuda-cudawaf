require 'puppet_x/modules/login_info'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_cloudcontrol).provide(:cudawaf_cloudcontrol_provider, :parent => Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists method of cudawaf_cloudcontrol_provider: ")
    @property_hash[:ensure] == :present
    return true
  end

  def self.instances
    Puppet.debug("Inside self instances method of cloud control provider")
    instances = []

    response = Puppet::Provider::Cudawaf.client_get "/control-center"
    Puppet.debug("Response for GET cloud-control API:  #{response}")

    cntrlObj = response["data"]
    state = cntrlObj['state']
    instances <<  new(
      :ensure => :present,
      :state => cntrlObj['state'],
      :connect_mode => 'cloud',
      :username => cntrlObj['username'],
      :validation_token => cntrlObj['validation_token']
    )

    return instances
  end

  def self.prefetch(resources)
    Puppet.debug("Calling self.prefetch method of cudawaf_cloudcontrol_provider: ")

    cloudobj = instances
    resources.keys.each do |state|
      if provider = cloudobj.find { |cloud| cloud.state == state}
        resources[state].provider = provider
      end    
    end
  end

  def flush
    Puppet.debug("Calling flush method of cudawaf_cloudcontrol_provider: ")

    if @property_hash != {}
      postdata = {
                   "connect_mode" => @resource["connect_mode"],
                   "state" => @resource["state"]
                 }

      if postdata['state'] == "connected"
        postdata["username"] = @resource["username"]
        postdata["password"] = @resource["password"]
      end

      response = Puppet::Provider::Cudawaf.client_put "/control-center", postdata.to_json
      Puppet.debug("Response from PUT cloud-control API:  #{response}")
    end

    return response
  end

end
