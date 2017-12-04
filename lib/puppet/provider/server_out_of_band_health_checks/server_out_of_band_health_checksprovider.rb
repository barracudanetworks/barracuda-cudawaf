require_relative '../../../puppet_x/modules/service_api.rb'
require_relative '../../../puppet_x/modules/server_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/modules/out_of_band_health_checks_api.rb'
require 'json'
require 'base64'
require 'logger'
require 'uri'

Puppet::Type.type(:server_out_of_band_health_checks).provide(:server_out_of_band_health_checksprovider) do
  Puppet.debug("Inside server_out_of_band_health_checksprovider: ")
  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists method of server_out_of_band_health_checksprovider: ")
    @property_hash[:ensure] == :present
    # getting waf authorization token
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    Puppet.debug("WAF authorization token:  #{auth_header}")
    service_instance = SwaggerClient::ServiceApi.new
    server_instance = SwaggerClient::ServerApi.new
    out_band_health_check_instance = SwaggerClient::OutOfBandHealthChecksApi.new
    #call get service
    serverName = @resource[:name]
    serviceName = @resource[:service_name]
    Puppet.debug("WAF server name in manifest:  #{serverName}")
    Puppet.debug("WAF service name in manifest : #{serviceName}")
    # Check for the existance of the Service before calling the server api.
    serviceresponse = service_instance.services_web_application_name_get(auth_header,serviceName,{})
    service_parsed_response = JSON.parse(serviceresponse)
    service_status_code=service_parsed_response["status_code"]
    if serviceresponse.to_s.empty?
       fail("Not able to process the request. Please check the request parameters")
    end
    # Checking if the service exists in the WAF system.
    if service_status_code === '200'
       # call get server
      data,status_code,headers= out_band_health_check_instance.services_web_application_name_servers_web_server_name_out_of_band_health_checks_get(auth_header,serviceName,serverName)
       Puppet.debug("status_code received from WAF api GET server:  #{status_code}")
       if status_code === 200
         true
       elsif status_code == 404
         false
       else
         fail("Not able to process the request. Pleae check your request parameters.")
       end
       # get server call ends
    elsif service_status_code === '404'
       fail("You can not create the server as the service associated is not available. ")
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
      svc = service
      Puppet.debug("Calling getInstances method of server_out_of_band_health_checksprovider: ")
      serviceName=svc
      Puppet.debug("Service Name : #{serviceName}")
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      server_instance = SwaggerClient::ServerApi.new
      # get all server_out_of_band_health_checks from WAF
      data,status_code,headers = server_instance.services_web_application_name_servers_get(auth_header,serviceName,{})
      Puppet.debug("WAF Get all server_out_of_band_health_checks response:    #{data}")
      response = JSON.parse(data)
      Puppet.debug("parsed response object is #{response}")
      svrData =response["data"]
      serviceName = response["Service"]
      Puppet.debug("The DATA:::::: #{svrData}")
      if svrData
         svcData.each do |key,value|
           servname = value["name"]
           val= value
           instances <<  new(
           :ensure => :present,
           :name => val["name"],
           :service_name => response["Service"]
           )
        end
      end # if end
    end# do end services 
    return instances
  end

  #this method get all services from WAF system and builds the instances array
  def self.getservices
     Puppet.debug("Calling getservices  method of server_out_of_band_health_checksprovider: ")
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
  def self.prefetch(resources)
    Puppet.debug("Calling prefetch method of server_out_of_band_health_checksprovider: ")
    servers = instances
    resources.keys.each do |name,service_name|
      if provider = services.find { |server| server.name == name && server.service_name == service_name}
         resources[name].provider=provider
      end
    end
  end

  def flush
    Puppet.debug("Calling flush method of server_out_of_band_health_checksprovider: ")
    if @property_hash != {}
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      server_instance = SwaggerClient::ServerApi.new
      out_band_health_check_instance = SwaggerClient::OutOfBandHealthChecksApi.new
      serverName=@resource[:name]
      serviceName=@resource[:name]
      data,status_code,headers = out_band_health_check_instance.services_web_application_name_servers_web_server_name_out_of_band_health_checks_put(auth_header,serviceName,serverName,message(resource),{})
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
    Puppet.debug("Calling create method of server_out_of_band_health_checksprovider: ")
  end

  def destroy
    Puppet.debug("Calling destroy method of server_out_of_band_health_checksprovider: ")
  end
end

