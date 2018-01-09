require 'puppet_x/modules/login_info'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_security_policy).provide(:cudawaf_security_policy_provider, :parent => Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  # this method will get security policy/security policyname and return true or false
  def exists?
    Puppet.debug("Calling exists method of security_policyprovider: ")
    @property_hash[:ensure] == :present
  end

  #this method get all security policys from WAF system and builds the instances array
  def self.instances
    Puppet.debug("Calling self.instances method of security_policyprovider: ")
    instances = []

    device_url = Puppet::Util::NetworkDevice.current ? Puppet::Util::NetworkDevice.current.url.to_s : Facter.value(:url)
    data, status_code, headers = Puppet::Provider::Cudawaf.get(device_url, "SecurityPolicy", {})
    Puppet.debug("WAF Get all security policy response: #{data}")

    unless data == '{}'
      if status_code == 200
        response = data
        policyobj = response["object"]
        policyData = response["data"]
        policyData.each do |key,value|
          val = value
          instances <<  new(
            :ensure => :present,
            :name => val["name"]
          )
        end
      end # if end
    end  # unless end
    
    return instances
  end

  # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug("Calling self.prefetch method of security_policyprovider: ")
    security_policies = instances
    resources.keys.each do |name|
      if provider = security_policies.find { |security_policy| security_policy.name == name}
        resources[name].provider=provider
      end
    end
  end

  # this method does a put call to waf security policy. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug("Calling flush method of security_policyprovider: ")
    if @property_hash != {}
      device_url = Puppet::Util::NetworkDevice.current ? Puppet::Util::NetworkDevice.current.url.to_s : Facter.value(:url)
      response, status_code, headers = Puppet::Provider::Cudawaf.get(device_url, "SecurityPolicy", @resource[:name], message(resource), {})
    end
    
    return response, status_code, headers
  end

  # this is a util method to build the JSON array to post the request to WAF
  def message(object)
    opts = object.to_hash
    opts.delete(:provider)
    opts.delete(:ensure)
    opts.delete(:loglevel)
    opts = convert_underscores(opts)
    params=opts
  
    return params
  end

  def convert_underscores(hash)
    hash.each_with_object({}) do |(k ,v), obj|
      key = k.to_s.gsub(/_/, '-').to_sym
      obj[key] = v
    end
  end


  # this method does a POST call to create a security policy in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug("Calling create method of security_policyprovider:")

    device_url = Puppet::Util::NetworkDevice.current ? Puppet::Util::NetworkDevice.current.url.to_s : Facter.value(:url)
    response, status_code, headers = Puppet::Provider::Cudawaf.get(device_url, "SecurityPolicy", message(resource), {})

    if status_code == 201
       @property_hash.clear
       return response, status_code, headers
    else
      fail("Not able to create the security policy. Please check the security policy api parameters")
    end
  end

  # this method will call the delete api of a WAF security policy
  def destroy
    Puppet.debug("Calling securitypolicy_provider destroy method: ")

    device_url = Puppet::Util::NetworkDevice.current ? Puppet::Util::NetworkDevice.current.url.to_s : Facter.value(:url)
    response, status_code, headers = Puppet::Provider::Cudawaf.get(device_url, "SecurityPolicy", @resource[:name], {})

    @property_hash.clear
    return response, status_code, headers
  end

end
