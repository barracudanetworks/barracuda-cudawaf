require_relative '../../../puppet_x/modules/service/service_api.rb'
require_relative '../../../puppet_x/modules/service/adaptive_profiling_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'

require 'json'
require 'base64'
require 'logger'
require 'uri'
#require 'rest-client'

Puppet::Type.type(:service_adaptive_profiling).provide(:service_adaptive_profilingprovider) do

  Puppet.debug("Inside service_adaptive_profilingprovider: ")

  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists method of service_adaptive_profilingprovider: ")
    @property_hash[:ensure] == :present
  end

=begin
  def self.instances
    Puppet.debug("Calling instances method of service_adaptive_profilingprovider: ")
    instances = []
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    service_instance = SwaggerClient::ServiceApi.new
    # get all service_adaptive_profiling from WAF
    data,status_code,headers = service_instance.services_get(auth_header,{})
    Puppet.debug("WAF Get all services response:    #{data}")
    
    unless data == '{}'
    if status_code == 200
      response = JSON.parse(data)
      svcobj = response["object"]
      Puppet.debug("Object is  #{svcobj}")
      svcData = response["data"]
      Puppet.debug("Service  data:  #{svcData}")
      svcData.each do |key,value|
        val= value
        Puppet.debug("Instances VAL  #{val}")
        instances <<  new(
          :ensure => :present,
          :name => val["name"],
          :ignore_parameters => val["ignore-parameters"],
          :content_types => val["content-types"],
          :trusted_host_group => val["trusted-host-group"],
          :status => val["status"],
          :navigation_parameters => val["navigation-parameters"],
          :response_learning => val["response-learning"],
          :request_learning => val["request-learning"]
        ) 
      end
   end # if end
  end  # unless end

    return instances
  end
=end


  #this method get all servers from WAF system and builds the instances array
def self.instances()
 Puppet.debug("Calling getservices method")
 services = getservices()

 Puppet.debug("List of services .................. #{services}")
 instances = []
 services.each do |service|

   svc = service
   Puppet.debug("Calling getInstances method of serverprovider: ")
   serviceName=svc
   Puppet.debug("Service Name : #{serviceName}")
   login_instance = Login.new
   auth_header = login_instance.get_auth_header
   adaptive_prof_instance = SwaggerClient::AdaptiveProfilingApi.new

   # get all servers from WAF
   data,status_code,headers = adaptive_prof_instance.services_web_application_name_adaptive_profiling_get(auth_header,serviceName,{})
   Puppet.debug("WAF Get all servers response:    #{data}")

   response = JSON.parse(data)
   Puppet.debug("parsed response object is #{response}")
   svrData = response["data"]
   serviceName = response["Service"]
   Puppet.debug("The DATA =======>>> #{svrData}")
   if svrData
     svrData.each do |key,value|
       servname = value["name"]
       val = value["Adaptive Profiling"]
       Puppet.debug("VAL is ... #{val}")
       instances <<  new(
          :ensure => :present,
          :name => servname,
          :ignore_parameters => val["ignore-parameters"],
          :content_types => val["content-types"],
          :trusted_host_group => val["trusted-host-group"],
          :status => val["status"],
          :navigation_parameters => val["navigation-parameters"],
          :response_learning => val["response-learning"],
          :request_learning => val["request-learning"]

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

    Puppet.debug("Calling prefetch method of service_adaptive_profilingprovider: ")
    services = instances
    resources.keys.each do |name|
    if provider = services.find { |service| service.name == name}
       resources[name].provider=provider
    end
  end

  end


  def flush
    Puppet.debug("Calling flush method of service_adaptive_profilingprovider: ")
    if @property_hash != {}
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      service_profling_instance=SwaggerClient::AdaptiveProfilingApi.new
      svcName=@resource[:name]
      data,status_code,headers= service_profling_instance.services_web_application_name_adaptive_profiling_put(auth_header,svcName,message(resource),{})
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
    Puppet.debug("Calling create method of service_adaptive_profilingprovider: ")
  end


  def destroy
    Puppet.debug("Calling destroy method of service_adaptive_profilingprovider: ")
  end

end

