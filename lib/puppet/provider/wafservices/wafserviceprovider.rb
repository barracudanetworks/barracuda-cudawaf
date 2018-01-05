require_relative '../../../puppet_x/modules/service_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'
require 'puppet/provider/cudawaf'

require 'json'
require 'base64'
require 'uri'
require 'logger'
require 'rest-client'

Puppet::Type.type(:wafservices).provide(:wafserviceprovider, :parent => Puppet::Provider::Cudawaf) do
  attr_accessor :transport, :url

  mk_resource_methods

  #device = $facts['node']
  device = Facter.value(:node)

  # this method will get service/servicename and return true or false 
  def exists?
    Puppet.debug("Calling exists method of wafserviceprovider for device #{device}: ")
    @property_hash[:ensure] == :present

    #
    #  Use the Puppet::Device::Transport layer to do the API call
    #
    response = @transport.get(device, "Service", "services_web_application_name_get", @resource[:name])
  end

  #this method get all services from WAF system and builds the instances array
  def self.instances
    Puppet.debug("Calling self.instances method of wafserviceprovider: ")
    instances = []

    data,status_code,headers = @transport.get(device, "Service", "services_get", {})
    Puppet.debug("WAF Get all services response: #{data}")

    unless data == '{}'
      if status_code == 200
        response = JSON.parse(data)

        svcobj = response["object"]
        Puppet.debug("Object is  #{svcobj}")
        svcData = response["data"]
        Puppet.debug("Service data:  #{svcData}")
        
        svcData.each do |key,value|
          val = value
          instances <<  new(
            :ensure => :present,
            :name => val["name"],
          ) 
        end
      end
    end

    return instances
  end

  # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug("Calling self.prefetch method of wafserviceprovider:")
    services = instances

    resources.keys.each do |name|
      if provider = services.find { |service| service.name == name}
      resources[name].provider=provider
      end    
    end
  end

  # this method does a put call to waf service. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug("Calling flush method of wafserviceprovider for device #{device}: ")
    if @property_hash != {}
      response = transport.put(device, "Service", "services_web_application_name_put", @resource[:name], transport.message(resource), {})
    end

    return response
  end

  # this method does a POST call to create a service in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug("Calling create method of wafserviceprovider for device #{device}:")

    response = transport.post(device, "Service", "services_post_with_http_info", transport.message(resource), {})
  end

  # this method will call the delete api of a WAF service 
  def destroy
    Puppet.debug("Calling wafserviceprovider destroy method for device #{device}: ")
    response = transport.delete(device, "Service", "services_web_application_name_delete", @resource[:name], {})

    # We clear the hash here to stop flush from triggering.
    @property_hash.clear

    return response
  end

end
