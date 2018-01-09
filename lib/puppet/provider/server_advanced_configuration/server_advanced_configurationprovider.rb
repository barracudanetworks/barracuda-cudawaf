require_relative '../../../puppet_x/modules/service/service_api.rb'
require_relative '../../../puppet_x/modules/server/server_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/modules/server/advanced_configuration_api.rb'
require 'json'
require 'base64'
require 'logger'
require 'uri'

Puppet::Type.type(:server_advanced_configuration).provide(:server_advanced_configurationprovider) do
  Puppet.debug("Inside server_advanced_configurationprovider: ")
  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists method of server_advanced_configurationprovider: ")
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
           val = value["Advanced Configuration"]
           instances <<  new(
             :ensure => :present,
             :name => value["name"],
             :service_name => response["Service"],
             :client_impersonation => val["client-impersonation"],
             :max_connections => val["max-connections"],
             :max_establishing_connections => val["max-establishing-connections"],
             :max_keepalive_requests => val["max-keepalive-requests"],
             :max_requests => val["max-requests"],
             :max_spare_connections => val["max-spare-connections"],
             :source_ip_to_connect => val["source-ip-to-connect"],
             :timeout => val["timeout"],
           )
        end
      end # if end
    end# do end services 
    return instances
  end

  #this method get all services from WAF system and builds the instances array
  def self.getservices
     Puppet.debug("Calling getservices  method of server_advanced_configurationprovider: ")
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
  end # self.prefetch

  def flush
    Puppet.debug("Calling flush method of server_advanced_configurationprovider: ")
    if @property_hash != {}
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      server_instance = SwaggerClient::ServerApi.new
      adv_server_instance = SwaggerClient::AdvancedConfigurationApi.new
      serverName=@resource[:name]
      serviceName=@resource[:service_name]
      data,status_code,headers = adv_server_instance.services_web_application_name_servers_web_server_name_advanced_configuration_put(auth_header,serviceName,serverName,message(resource),{})
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
    Puppet.debug("Calling create method of server_advanced_configurationprovider: ")
  end

  def destroy
    Puppet.debug("Calling destroy method of server_advanced_configurationprovider: ")
  end

end

