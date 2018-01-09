require_relative '../../../puppet_x/modules/service/service_api.rb'
require_relative '../../../puppet_x/modules/rule_group/rule_group_api.rb'
require_relative '../../../puppet_x/modules/rule_group/rule_group_load_balancing_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'

require 'json'
require 'base64'
require 'uri'
require 'logger'
Puppet::Type.type(:rule_group_load_balancing).provide(:rule_group_load_balancingprovider) do

  mk_resource_methods

  # this method will get server/servername and return true or false
  def exists?
    @property_hash[:ensure] == :present
  end


  #this method get all servers from WAF system and builds the instances array
  def self.instances()
    Puppet.debug("Calling self.instances method")
    services = getservices()

    instances = []
    services.each do |service|

      svc = service
      serviceName = svc

      Puppet.debug("Service Name : #{serviceName}")

      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      rule_instance = SwaggerClient::RuleGroupApi.new

      # get all servers from WAF
      data,status_code,headers = rule_instance.services_web_application_name_content_rules_get(auth_header,serviceName,{})
      Puppet.debug("WAF Get all servers response:    #{data}")

      response = JSON.parse(data)
      Puppet.debug("parsed response object is #{response}")

      if !response.has_key?("data") then
        next
      end

      svrData = response["data"]
      serviceName = response["Service"]
      Puppet.debug("The DATA:::::: #{svrData}")

      if svrData
        svrData.each do |key,value|
          val = value["Load Balancing"]
          instances << new(
            :ensure => :present,
            :name => value["name"],
            :service_name => response["Service"],
            :cookie_age => val["cookie-age"],
            :failover_method => val["failover-method"],
            :header_name => val["header-name"],
            :lb_algorithm => val["lb-algorithm"],
            :parameter_name => val["parameter-name"],
            :persistence_cookie_domain => val["persistence-cookie-domain"],
            :persistence_cookie_name => val["persistence-cookie-name"],
            :persistence_cookie_path => val["persistence-cookie-path"],
            :persistence_idle_timeout => val["persistence-idle-timeout"],
            :persistence_method => val["persistence-method"],
            :source_ip_netmask => val["source-ip-netmask"],
          )
        end
      end

    end # do end services
    return instances
  end


  #this method get all services from WAF system and builds the instances array
  def self.getservices

    Puppet.debug("Calling getservices  method of serverprovider: ")
    service_instances = []

    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    service_instance = SwaggerClient::ServiceApi.new

    # get all services from WAF
    data,status_code,headers = service_instance.services_get(auth_header,{})
    Puppet.debug("WAF Get all services response:    #{data}")

    unless data == '{}'
      if status_code == 200
        response = JSON.parse(data)
        svcobj = response["object"]

        Puppet.debug("Object is  #{svcobj}")

        svcData = response["data"]
        Puppet.debug("Service  data - having servers:  #{svcData}")

        svcData.each do |key,value|
          service_instances.push(value["name"])
        end
      end # if end
    end  # unless end
    return service_instances
  end


  def self.prefetch(resources)
    Puppet.debug("Calling self.prefetch method of serverprovider: ")

    servers = instances
    resources.keys.each do |name|
      provider = servers.find do |server|
        resources[name][:name].to_s == server.name.to_s &&
        resources[name][:service_name].to_s == server.service_name.to_s
      end
      resources[name].provider = provider unless provider.nil?
    end
  end


  # this method does a put call to waf servers. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug("Calling  flush method of serverprovider: ")

    if @property_hash != {}
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      rule_group_load_balancing_instance = SwaggerClient::RuleGroupLoadBalancingApi.new

      ruleName = @resource[:name]
      serviceName = @resource[:service_name]
      Puppet.debug("WAF server name in manifest: #{ruleName}")

      data,status_code,headers = rule_group_load_balancing_instance.services_web_application_name_content_rules_rule_group_name_load_balancing_put(auth_header,serviceName,ruleName,message(resource),{})

      if status_code == 200
        return data
      else
        Puppet.debug("There is some problem to process the request. status_code is #{status_code}")
        return
      end
    end
  end

  # this is a util method to build the JSON array to post the request to WAF
  def message(object)

    parameters = object.to_hash
    Puppet.debug("Parameters.......... #{parameters}")

    ruleName = @resource[:name]

    parameters.delete(:provider)
    parameters.delete(:ensure)
    parameters.delete(:loglevel)
    parameters.delete(:name)
    parameters.delete(:service_name)
    parameters = convert_underscores(parameters)
    return parameters
  end

  def convert_underscores(hash)
    # Here lies some evil magic.  We want to replace all _'s with -'s in the
    # key names of the hash we create from the object we've passed into message.
    #
    # We do this by passing in an object along with .each, giving us an empty
    # hash to then build up with the fixed names.
    hash.each_with_object({}) do |(k ,v), obj|
      key = k.to_s.gsub(/_/, '-').to_sym
      obj[key] = v
    end
  end



  # this method does a POST call to create a server in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug("Calling create method of rule group provider:")
  end

  # this method will call the delete api of a WAF service
  def destroy
    Puppet.debug("Calling rule group provider destroy method: ")
  end

end
