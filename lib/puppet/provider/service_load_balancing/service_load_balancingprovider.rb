require_relative '../../../puppet_x/modules/service/service_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/modules/service/load_balancing_api.rb'
require 'json'
require 'base64'
require 'logger'
require 'uri'

Puppet::Type.type(:service_load_balancing).provide(:service_load_balancingprovider) do
  Puppet.debug("Inside service_load_balancingprovider: ")

  mk_resource_methods

def exists?
  Puppet.debug("Calling exists method of service_load_balancingprovider: ")
  @property_hash[:ensure] == :present
end

#this method get all servers from WAF system and builds the instances array
def self.instances()
 Puppet.debug("Calling getservices method")
 services = getservices()

 Puppet.debug("List of services .................. #{services}")
 instances=[]
 services.each do |service|

   svc = service
   Puppet.debug("Calling getInstances method of service load balance provider: ")
   serviceName=svc
   Puppet.debug("Service Name : #{serviceName}")
   login_instance = Login.new
   auth_header = login_instance.get_auth_header
   service_loadbalance_instance = SwaggerClient::LoadBalancingApi.new
   data,status_code,headers = service_loadbalance_instance.services_web_application_name_load_balancing_get(auth_header,serviceName,{})
   Puppet.debug("WAF Get all servers response:    #{data}")

   response = JSON.parse(data)
   Puppet.debug("parsed response object is #{response}")
   svrData =response["data"]
   serviceName = response["Service"]
   Puppet.debug("The DATA =======>>> #{svrData}")
   if svrData
     svrData.each do |key,value|
       Puppet.debug("Value....... is #{value}")
       servname = value["name"]
       val = value["Load Balancing"]
       Puppet.debug("VAL is ... #{val}")
       instances <<  new(
          :ensure => :present,
          :name => servname,
          :persistence_cookie_domain => val["persistence-cookie-domain"],
          :algorithm => val["algorithm"],
          :source_ip_netmask => val["source-ip-netmask"],
          :cookie_age => val["cookie-age"],
          :persistence_method => val["persistence-method"],
          :persistence_idle_timeout => val["persistence-idle-timeout"],
          :persistence_cookie_name => val["persistence-cookie-name"],
          :persistence_cookie_path => val["persistence-cookie-path"],
          :parameter_name => val["parameter_name"],
          :header_name => val["header_name"],
          :failover_method => val["failover_method"]
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
  Puppet.debug("Calling prefetch method of service_load_balancingprovider: ")
  services = instances
  resources.keys.each do |name|
    if provider = services.find { |service| service.name == name}
      resources[name].provider=provider
    end
  end
end

def flush
  Puppet.debug("Calling flush method of service_load_balancingprovider: ")
  if @property_hash != {}
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    service_loadbalance_instance = SwaggerClient::LoadBalancingApi.new
    svcName=@resource[:name]
    data,status_code,headers= service_loadbalance_instance.services_web_application_name_load_balancing_put(auth_header,svcName,message(resource),{})
    Puppet.debug("WAF services PUT response:  #{data}")
  end
  return data
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
  Puppet.debug("Calling create method of service_load_balancingprovider: ")
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  service_loadbalance_instance = SwaggerClient::LoadBalancingApi.new
  svcName=@resource[:name]
  data,status_code,headers= service_loadbalance_instance.services_web_application_name_load_balancing_post(auth_header,svcName,message(resource),{})
  Puppet.debug("WAF services CREATE response:  #{data}")
  if status_code == 201
    @property_hash.clear
    return data
  else
    fail("Not able to create the service. Please check the service api parameters")
  end
end

def destroy
  Puppet.debug("Calling destroy method of service_load_balancingprovider: ")
end
end
