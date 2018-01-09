require_relative '../../../puppet_x/modules/service/service_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/modules/service/basic_security_api.rb'
require 'json'
require 'base64'
require 'logger'
require 'uri'

Puppet::Type.type(:service_basic_security).provide(:service_basic_securityprovider) do

  Puppet.debug("Inside service_basic_securityprovider: ")

  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists method of service_basic_securityprovider: ")
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
   Puppet.debug("Calling getInstances method of serverprovider: ")
   serviceName=svc
   Puppet.debug("Service Name : #{serviceName}")
   login_instance = Login.new
   auth_header = login_instance.get_auth_header
   service_basic_security_instance = SwaggerClient::BasicSecurityApi.new
   # get all servers from WAF
   data,status_code,headers =service_basic_security_instance.services_web_application_name_basic_security_get(auth_header,serviceName,{})
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
       val = value["Basic Security"]
       Puppet.debug("VAL is ... #{val}")
       instances <<  new(
          :ensure => :present,
          :name => servname,
          :mode => val["mode"],
          :ignore_case => val["ignore-case"],
          :web_firewall_policy => val["web-firewall-policy"],
          :rate_control_status => val["rate-control-status"],
          :rate_control_pool => val["rate-control-pool"],
          :web_firewall_log_level => val["web-firewall-log-level"],
          :trusted_hosts_group => val["trusted-hosts-group"],
          :client_ip_addr_header => val["client-ip-addr-header"],
          :trusted_hosts_action => val["trusted-hosts-action"]
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

    Puppet.debug("Calling prefetch method of service_basic_securityprovider: ")
    services = instances
    resources.keys.each do |name|
    if provider = services.find { |service| service.name == name}
       resources[name].provider=provider
    end
  end

  end


  def flush

    Puppet.debug("Calling flush method of service_basic_securityprovider: ")

    if @property_hash != {}

    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    service_basic_security_instance = SwaggerClient::BasicSecurityApi.new
    svcName=@resource[:name]
    data,status_code,headers= service_basic_security_instance.services_web_application_name_basic_security_put(auth_header,svcName,message(resource),{})
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
    Puppet.debug("Calling create method of service_basic_securityprovider: ")
  end


  def destroy
    Puppet.debug("Calling destroy method of service_basic_securityprovider: ")
  end


end

