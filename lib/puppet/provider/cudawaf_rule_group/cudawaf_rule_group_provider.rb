require 'puppet_x/modules/login_info'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_rule_group).provide(:cudawaf_rule_group_provider, :parent => Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  def exists?
    @property_hash[:ensure] == :present
  end

  def self.instances()
    Puppet.debug("Calling self.instances method")
    services = getservices()
    instances = []

    services.each do |service|
      response,status_code,headers = Puppet::Provider::Cudawaf.get("ContentRule", service, {})
      Puppet.debug("parsed response object is #{response}")

      if !response.has_key?("data") then
        next
      end

      svrData = response["data"]
      serviceName = response["Service"]

      if svrData
        svrData.each do |key,value|
          servname = value["name"]
          val = value
          instances <<  new(
            :ensure => :present,
            :name => servname,
            :service_name => response["Service"],
            :app_id => val["app-id"],
            :comments  => val["comments"],
            :extended_match => val["extended-match"],
            :extended_match_sequence => val["extended-match-sequence"],
            :host_match => val["host-match"],
            :mode => val["mode"],
            :status => val["status"],
            :url_match => val["url-match"],
            :web_firewall_policy => val["web-firewall-policy"]
          )
        end
      end
    end # do end services

    return instances
  end

  #this method get all services from WAF system and builds the instances array
  def self.getservices
    service_instances = []

    data,status_code,headers = Puppet::Provider::Cudawaf.get("Service", {})
    Puppet.debug("WAF Get all services response:    #{data}")

    unless data == '{}'
      if status_code == 200
        response = data
        svcobj = response["object"]
        svcData = response["data"]

        svcData.each do |key,value|
          service_instances.push(value["name"])
        end
      end # if end
    end  # unless end

    return service_instances
  end

  # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug("Calling self.prefetch method of cudawaf_rule_group_provider: ")

    servers = instances
    resources.keys.each do |name|
      provider = servers.find do |server|
        resources[name][:name].to_s == server.name.to_s &&
        resources[name][:service_name].to_s == server.service_name.to_s
      end
      resources[name].provider = provider unless provider.nil?
    end
  end

  def flush
    Puppet.debug("Calling  flush method of cudawaf_rule_group_provider: ")
    if @property_hash != {}
      response, status_code, headers = Puppet::Provider::Cudawaf.put("ContentRule", @resource[:service_name], @resource[:name], message(resource), {})

      if status_code == 200
        return response, status_code, headers
      else
        Puppet.debug("There is some problem to process the request. status_code is #{status_code}")
        return
      end
    end
  end

  # this is a util method to build the JSON array to post the request to WAF
  def message(object)
    parameters = object.to_hash

    parameters.delete(:provider)
    parameters.delete(:ensure)
    parameters.delete(:loglevel)
    parameters.delete(:service_name)
    parameters = convert_underscores(parameters)

    return parameters
  end

  def convert_underscores(hash)
    hash.each_with_object({}) do |(k ,v), obj|
      key = k.to_s.gsub(/_/, '-').to_sym
      obj[key] = v
    end
  end

  # this method does a POST call to create a rule group in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug("Calling create method of cudawaf_rule_group_provider:")

    response, status_code, headers = Puppet::Provider::Cudawaf.post("ContentRule", @resource[:service_name], message(resource), {})

    # We clear the hash here to stop flush from triggering.
    @property_hash.clear

    return response, status_code, headers
  end

  # this method will call the delete API of a WAF rule group
  def destroy
    Puppet.debug("Calling destroy method of cudawaf_rule_group_provider: ")

    response, status_code, headers = Puppet::Provider::Cudawaf.delete("ContentRule", @resource[:service_name], @resource[:name], {})

    # We clear the hash here to stop flush from triggering.
    @property_hash.clear

    return response, status_code, headers
  end

end
