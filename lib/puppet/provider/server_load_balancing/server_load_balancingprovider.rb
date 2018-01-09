require_relative '../../../puppet_x/modules/service/service_api.rb'
require_relative '../../../puppet_x/modules/server/server_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/modules/server/load_balancing_api.rb'
require 'json'
require 'base64'
require 'logger'
require 'uri'

Puppet::Type.type(:server_load_balancing).provide(:server_load_balancingprovider) do
  Puppet.debug("Inside server_load_balancingprovider: ")
  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists method of server_load_balancingprovider: ")
    @property_hash[:ensure] == :present
  end

  def self.instances
    Puppet.debug("Calling self.instances method")

    Puppet.debug("Calling getservices method")
    services = getservices()

    instances = []
    services.each do |service|
      svc = service
      serviceName = svc
      Puppet.debug("Service Name : #{serviceName}")

      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      server_instance = SwaggerClient::ServerApi.new

      # get all server_advanced_configuration from WAF
      data,status_code,headers = server_instance.services_web_application_name_servers_get(auth_header,serviceName,{})
      Puppet.debug("WAF Get all servers response:    #{data}")

      response = JSON.parse(data)
      Puppet.debug("parsed response object is #{response}")

	  if !response.has_key?("data") then
        next
      end

      svrData = response["data"]

      if svrData
         svrData.each do |key,value|
           val = value["Load Balancing"]
           instances <<  new(
             :ensure => :present,
             :name => value["name"],
             :service_name => response["Service"],
             :backup_server => val["backup-server"],
             :weight => val["weight"],
           )
        end
      end # if end
    end# do end services
    return instances    
  end

  #this method get all services from WAF system and builds the instances array
  def self.getservices
     Puppet.debug("Calling getservices  method of server_load_balancingprovider: ")
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
    Puppet.debug("Calling flush method of server_load_balancingprovider: ")
    if @property_hash != {}
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      server_instance = SwaggerClient::ServerApi.new
      load_bal_api_instance = SwaggerClient::LoadBalancingApi.new
      serverName=@resource[:name]
      serviceName=@resource[:service_name]
      data,status_code,headers = load_bal_api_instance.services_web_application_name_servers_web_server_name_load_balancing_put(auth_header,serviceName,serverName,message(resource),{})
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
    Puppet.debug("Calling create method of server_load_balancingprovider: ")
  end

  def destroy
    Puppet.debug("Calling destroy method of server_load_balancingprovider: ")
  end
end

