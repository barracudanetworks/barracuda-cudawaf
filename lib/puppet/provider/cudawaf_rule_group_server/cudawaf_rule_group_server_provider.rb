require 'puppet_x/modules/login_info'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_rule_group_server).provide(:cudawaf_rule_group_server_provider, :parent => Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists method of cudawaf_rule_group_server_provider: ")
    @property_hash[:ensure] == :present
  end

  def self.instances
    Puppet.debug("Calling self.instances method")

    services = getservices()
    instances = []

    services.each do |service|
      rules = getrules(service)
      rules.each do |rule|
        response, status_code, headers = Puppet::Provider::Cudawaf.get("ContentRuleServer", service, rule, {})
        Puppet.debug("WAF Get all rule_group_server response:  #{response}")

        svrData = response["data"]
        service_name = response["Service"]
        rule_group_name = response["Rule Group"]

        if svrData
          svrData.each do |key, val|
             instances <<  new(
               :ensure => :present,
               :name => val["name"],
               :rule_group_name => rule_group_name,
               :service_name => response["Service"],
               :address_version => val["address-version"],
               :backup_server => val["backup-server"],
               :comments => val["comments"],
               :hostname => val["hostname"],
               :identifier => val["identifier"],
               :ip_address => val["ip-address"],
               :port => val["port"],
               :status => val["status"],
               :weight => val["weight"]
             )
        end
      end # if end
     end  # if end for rules
    end# do end services 

    return instances
  end

  #this method get all services from WAF system and builds the instances array
  def self.getservices
     Puppet.debug("Calling getservices  method of cudawaf_rule_group_server_provider: ")
     service_instances = []

     data,status_code,headers = Puppet::Provider::Cudawaf.get("Service", {})
     Puppet.debug("WAF Get all services response:    #{data}")

     unless data == '{}'
       if status_code == 200
          response = data
          svcData = response["data"]

          svcData.each do |key,value|
             service_instances.push(value["name"])
          end
        end
     end

    return service_instances
  end

  #this method get all rules from WAF system and builds the instances array
  def self.getrules(service_name)
     Puppet.debug("Calling getrules method of cudawaf_rule_group_server_provider: ")
     rule_group_instances = []

     data,status_code,headers = Puppet::Provider::Cudawaf.get("ContentRule", service_name, {})
     Puppet.debug("WAF Get all rules response:    #{data}")

     unless data == '{}'
       if status_code == 200
          response = data
          svcData = response["data"]

          unless svcData.nil?
            svcData.each do |key,value|
               rule_group_instances.push(value["name"])
            end
          end
        end
     end

    return rule_group_instances
  end

  def self.prefetch(resources)
    rules = instances
    resources.keys.each do |name|
      provider = rules.find do |rule|
        resources[name][:name].to_s == rule.name.to_s &&
        resources[name][:service_name].to_s == rule.service_name.to_s &&
        resources[name][:rule_group_name].to_s == rule.rule_group_name.to_s
      end

      resources[name].provider = provider unless provider.nil?
    end
  end # self.prefetch

  def flush
    Puppet.debug("Calling flush method of cudawaf_rule_group_server_provider: ")

    if @property_hash != {}
      response, status_code, headers = Puppet::Provider::Cudawaf.put("ContentRuleServer", @resource[:service_name], @resource[:rule_group_name], @resource[:name], message(resource, "PUT"), {})

      if status_code == 200
        return response, status_code, headers
      else
        Puppet.debug("There is some problem to process the request. status_code is #{status_code}")
      end
    end
  end

  def message(object,method)
    parameters = object.to_hash

    serverName=@resource[:name]

    val = parameters.has_key?(:identifier)
    val2 = parameters[:identifier]

    if parameters.has_key?(:identifier) && parameters[:identifier] == :Hostname
      hostname = nil
      if parameters.key?:hostname
        hostname = parameters[:hostname]
      else
        fail("hostname is required parameter in the manifest if identifier is set to hostname.")
      end

      if hostname.nil?
        fail("hostname is empty. Please add a valid hostname since the identifier is set to hostname.")
      else
        parameters[:identifier]="Hostname"
        parameters[:hostname]=hostname
      end
    else
      ip_address = nil
      if parameters.key?:ip_address
        ip_address = parameters[:ip_address]

        if ip_address.nil?
          fail("ip_address is empty. Please a valid value for it.")
        else
          parameters[:identifier]="IP Address"
          parameters[:ip_address]=ip_address
        end
      else
        fail("ip_address is required parameter in the manifest.")
      end
    end

    parameters.delete(:provider)
    parameters.delete(:ensure)
    parameters.delete(:loglevel)
    parameters.delete(:service_name)
    parameters.delete(:rule_group_name)

    if method === "PUT"
      parameters.delete(:address_version)
    end

    parameters=convert_underscores(parameters)
    return parameters
  end

  def convert_underscores(hash)
    hash.each_with_object({}) do |(k ,v), obj|
      key = k.to_s.gsub(/_/, '-').to_sym
      obj[key] = v

    end
  end

  def create
    Puppet.debug("Calling create method of cudawaf_rule_group_server_provider: ")

    response, status_code, headers = Puppet::Provider::Cudawaf.post("ContentRuleServer", @resource[:service_name], @resource[:rule_group_name], message(resource, "POST"), {})
    if status_code == 201
      @property_hash.clear
      return response, status_code, headers
    else
      fail("Not able to create the rule_group_server. Please check the rule_group_server api parameters")
    end
  end

  def destroy
    Puppet.debug("Calling destroy method of cudawaf_rule_group_server_provider: ")

    response, status_code, headers = Puppet::Provider::Cudawaf.delete("ContentRuleServer", @resource[:service_name], @resource[:rule_group_name], @resource[:name], {})

    @property_hash.clear
    return response, status_code, headers
  end

end
