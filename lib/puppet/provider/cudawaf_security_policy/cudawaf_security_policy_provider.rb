require_relative '../../../puppet_x/modules/login_info'
require_relative '../../../puppet_x/modules/utils'
require File.join(File.dirname(__FILE__), '../cudawaf')

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_security_policy).provide(:cudawaf_security_policy_provider, parent: Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  # this method will get security policy name and return true or false
  def exists?
    Puppet.debug(self.class.to_s.split('::').last + ': Calling exists method : ')
    @property_hash[:ensure] == :present
  end

  # this method get all security policies from WAF system and builds the instances array
  def self.instances
    Puppet.debug(to_s.split('::').last + ': Calling self.instances method : ')
    instances = []

    response, status_code, headers = Puppet::Provider::Cudawaf.get('SecurityPolicy', {})
    Puppet.debug(to_s.split('::').last + ": WAF Get all security policies response: #{response}")

    unless response.nil?
      if status_code == 200
        policyData = response['data']
        unless policyData.nil?
          policyData.each do |_key, value|
            val = value
            instances << new(
              ensure: :present,
              name: val['name']
            )
          end
        end # if policyData end
      end # if end
    end # unless end

    instances
  end

  # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug(to_s.split('::').last + ': Calling self.prefetch method : ')
    security_policies = instances
    resources.keys.each do |name|
      if provider = security_policies.find { |security_policy| security_policy.name == name }
        resources[name].provider = provider
      end
    end
  end

  # this method does a put call to waf security policy. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug(self.class.to_s.split('::').last + ': Calling flush method : ')
    if @property_hash != {}
      response, status_code, headers = Puppet::Provider::Cudawaf.put('SecurityPolicy', @resource[:name], message(resource), {})
    end

    [response, status_code, headers]
  end

  # this method does a POST call to create a security policy in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug(self.class.to_s.split('::').last + ': Calling create method :')

    response, status_code, headers = Puppet::Provider::Cudawaf.post('SecurityPolicy', message(resource), {})

    if status_code == 201
      @property_hash.clear
      return response, status_code, headers
    else
      raise(self.class.to_s.split('::').last + ': Not able to create the security policy. Please check the security policy api parameters')
    end
  end

  # this method will call the delete api of a WAF security policy
  def destroy
    Puppet.debug(self.class.to_s.split('::').last + ': Calling destroy method : ')

    response, status_code, headers = Puppet::Provider::Cudawaf.delete('SecurityPolicy', @resource[:name], {})
    @property_hash.clear
    [response, status_code, headers]
  end
end
