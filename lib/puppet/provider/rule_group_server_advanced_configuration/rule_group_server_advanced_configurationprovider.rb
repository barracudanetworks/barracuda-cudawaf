require_relative '../../../puppet_x/modules/service/service_api.rb'
require_relative '../../../puppet_x/modules/rule_group_server/rule_group_server_api.rb'
require_relative '../../../puppet_x/modules/rule_group_server/rule_group_server_advanced_configuration_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/modules/rule_group/rule_group_api.rb'
require 'json'
require 'base64'
require 'logger'
require 'uri'

Puppet::Type.type(:rule_group_server_advanced_configuration).provide(:rule_group_server_advanced_configurationprovider) do
  Puppet.debug("Inside rule_group_server_advanced_configurationprovider: ")
  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists method of rule_group_server_advanced_configurationprovider: ")
    @property_hash[:ensure] == :present
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    service_instance = SwaggerClient::ServiceApi.new
    rule_group_instance = SwaggerClient::RuleGroupApi.new
    rule_group_server_instance = SwaggerClient::RuleGroupServerAdvancedConfigurationApi.new
    #call get service
    serviceName = @resource[:service_name]
    rule_group_name = @resource[:rule_group_name]
    rule_grp_server_Name = @resource[:name]
    Puppet.debug("WAF rule_grp_server_Name in manifest:  #{rule_grp_server_Name}")
    Puppet.debug("WAF rule_group_name in manifest : #{rule_group_name}")
    Puppet.debug("WAF serviceName in manifest : #{serviceName}")
    serviceresponse = service_instance.services_web_application_name_get(auth_header,serviceName,{})
    service_parsed_response = JSON.parse(serviceresponse)
    service_status_code=service_parsed_response["status_code"]
    if serviceresponse.to_s.empty?
       fail("Not able to process the request. Please check the request parameters")
    end
    # Checking if the service exists in the WAF system.
    if service_status_code === '200'
    # check if the rule group exists'
         data,status_code,headers=rule_group_instance.services_web_application_name_content_rules_rule_group_name_get(auth_header,serviceName,rule_group_name)
      Puppet.debug("status_code received from WAF api GET rule group:  #{status_code}")
         if status_code === 200
           data,status_code,headers=rule_group_server_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_get(auth_header,serviceName,rule_group_name,rule_grp_server_Name)
             if status_code === 200
                true
              elsif status_code == 404
                false
              else
                fail("Not able to process the request. Please check your request parameters.")
              end
            # get rule group server call ends
         elsif status_code == 404
            fail("Not able to process the request. Please check your request parameters.")
         else
            fail("Not able to process the request. Please check your request parameters.")
         end
   # get rule group call ends
      elsif status_code == 404
        fail("Not able to process the request. Please check your request parameters.")
      else
        fail("Not able to process the request. Please check your request parameters.")
      end
   # get service call ends
  end

  def self.instances

    Puppet.debug("Calling getservices method")
    services = getservices()
    Puppet.debug("List of services .................. #{services}")
    instances = []
    services.each do |service|
      serviceName=service
      rules = getrules(serviceName)
      rules.each do |rule|
        rule_name = rule
        Puppet.debug("Calling getInstances method of rule_group_server_advanced_configurationprovider: ")
        Puppet.debug("Service Name : #{serviceName}")
        Puppet.debug("rule group Name : #{rule_name}")
        login_instance = Login.new
        auth_header = login_instance.get_auth_header
        rule_group_server_instance = SwaggerClient::RuleGroupServerApi.new
        # get all rule_group_server_advanced_configuration from WAF
        data,status_code,headers = rule_group_server_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_get(auth_header,serviceName,rule_name,{})
        Puppet.debug("WAF Get all rule_group_server_advanced_configuration response:    #{data}")
        response = JSON.parse(data)
        svrData =response["data"]
        service_name = response["Service"]
        rule_group_name = response["Rule Group"]
        Puppet.debug("The DATA:::::: #{svrData}")
        if svrData
          svrData.each do |key,value|
             rule_grp_server_name = value["name"]
             val= value
             instances <<  new(
               :ensure => :present,
               :name => rule_grp_server_name,
               :rule_group_name => rule_group_name,
               :service_name => response["Service"]
             )
        end
      end # if end
      end  # rules end
    end# do end services 
    return instances
  end

  #this method get all services from WAF system and builds the instances array
  def self.getservices
     Puppet.debug("Calling getservices  method of rule_group_server_advanced_configurationprovider: ")
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
        end
     end
    return service_instances
  end
  #this method get all rules from WAF system and builds the instances array
  def self.getrules(service_name)
     Puppet.debug("Calling getrules  method of rule_group_server_advanced_configurationprovider: ")
     rule_group_instances = []
     login_instance = Login.new
     auth_header = login_instance.get_auth_header
     rule_group_instance = SwaggerClient::RuleGroupApi.new
   # get all services from WAF
     data,status_code,headers = rule_group_instance.services_web_application_name_content_rules_get(auth_header,service_name,{})
     Puppet.debug("WAF Get all rules response:    #{data}")
     unless data == '{}'
       if status_code == 200
          response = JSON.parse(data)
          svcobj = response["object"]
          Puppet.debug("Object is  #{svcobj}")
          svcData = response["data"]
         Puppet.debug("rule group  data - having rules:  #{svcData}")
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
    Puppet.debug("Calling prefetch method of rule_group_server_advanced_configurationprovider: ")
    rules = instances
    resources.keys.each do |name,service_name|
      if provider = rules.find { |rule_server| rule_server.name == name && rule_server.service_name == service_name && rule_server.rule_group_name == rule_group_name}
         resources[name].provider=provider
      end
    end
  end

  def flush
    Puppet.debug("Calling flush method of rule_group_server_advanced_configurationprovider: ")
    if @property_hash != {}
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      rule_group_server_instance = SwaggerClient::RuleGroupServerAdvancedConfigurationApi.new
    serviceName = @resource[:service_name]
    rule_group_name = @resource[:rule_group_name]
    rule_grp_server_Name = @resource[:name]
      data,status_code,headers = rule_group_server_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_put(auth_header,serviceName,rule_group_name,rule_grp_server_Name,message(resource),{})
      Puppet.debug("WAF services PUT response:  #{data}")
        if status_code == 200
          return data
        else
          Puppet.debug("There is some problem to process the request. status_code is #{status_code}")
          return
        end
    end
  end

  def message(object)
    opts=object.to_hash

    opts.delete(:provider)
    opts.delete(:ensure)
    opts.delete(:loglevel)
    opts.delete(:name)
    opts.delete(:service_name)
    opts.delete(:rule_group_name)
    opts=convert_underscores(opts)
    params=opts
    Puppet.debug("PARAM....................#{params}")
    return params
  end

  def convert_underscores(hash)
    hash.each_with_object({}) do |(k ,v), obj|
      key = k.to_s.gsub(/_/, '-').to_sym
      obj[key] = v

    end
  end

  def create
    Puppet.debug("Calling create method of rule_group_server_advanced_configurationprovider: ")
  end
  
  def destroy
    Puppet.debug("Calling destroy method of rule_group_server_advanced_configurationprovider: ")
  end

end

