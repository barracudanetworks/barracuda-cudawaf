require_relative '../../../puppet_x/modules/service_api.rb'
require_relative '../../../puppet_x/modules/server_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'

require 'json'
require 'base64'
require 'uri'
require 'logger'
require 'rest-client'
Puppet::Type.type(:wafservers).provide(:wafserverprovider) do

  Puppet.debug("Inside wafserverprovider: ")
  mk_resource_methods

# this method will get server/servername and return true or false
def exists?
  Puppet.debug("Calling exists method of wafsererprovider: ")
  @property_hash[:ensure] == :present

  # getting waf authorization token
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  Puppet.debug("WAF authorization token:  #{auth_header}")
  service_instance = SwaggerClient::ServiceApi.new
  server_instance = SwaggerClient::ServerApi.new

# call get service

  serverName = @resource[:name]
  serviceName = @resource[:service_name]
  Puppet.debug("WAF server name in manifest:  #{serverName}")
  Puppet.debug("WAF service name in manifest : #{serviceName}")
  # Check for the existance of the Service before calling the server api.
#  options={}
  serviceresponse = service_instance.services_web_application_name_get(auth_header,serviceName,{})
  service_parsed_response = JSON.parse(serviceresponse)
  service_status_code=service_parsed_response["status_code"]

  if serviceresponse.to_s.empty?
    fail("Not able to process the request. Please check the request parameters")
  end

# Checking if the service exists in the WAF system.

  if service_status_code === '200'
   # call get server
    data,status_code,headers=server_instance.services_web_application_name_servers_server_name_get(auth_header,serviceName,serverName)
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
    fail("Not able to process the request. Pleae check your request parameters.")
 end
# get service call ends

end


#this method get all servers from WAF system and builds the instances array
def self.instances()
 Puppet.debug("Calling getservices method")
 services = getservices()

 Puppet.debug("List of services .................. #{services}")
 instances=[]
 services.each do |service|

   svc = service
   Puppet.debug("Callling getInstances method of wafserverprovider: ")
   serviceName=svc
   Puppet.debug("Service Name : #{serviceName}")
   login_instance = Login.new
   auth_header = login_instance.get_auth_header
   server_instance = SwaggerClient::ServerApi.new

   # get all servers from WAF
   data,status_code,headers = server_instance.services_web_application_name_servers_get(auth_header,serviceName,{})
   Puppet.debug("WAF Get all servers response:    #{data}")

   response = JSON.parse(data)
   Puppet.debug("parsed response object is #{response}")
   svrData =response["data"]
   serviceName = response["Service"]
   Puppet.debug("The DATA:::::: #{svrData}")
   if svrData
     svrData.each do |key,value|
       servname = value["name"]
       val = value
       instances <<  new(
         :ensure => :present,
         :name => val["name"],
         :service_name => response["Service"]
       )
     end
   end

  end # do end services
  return instances
end


#this method get all services from WAF system and builds the instances array
def self.getservices

  Puppet.debug("Callling getservices  method of wafserverprovider: ")
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




# this method compares the name attribute from instances and resources. If it matches then sets the provider
def self.prefetch(resources)

  Puppet.debug("Calling self.prefetch method of wafserverprovider: ")
  servers = instances
  resources.each do |name,service_name|
     if provider = servers.find { |server| server.name == name && server.service_name == service_name}
#     if provider = servers.find { |server| server.name == name}
     resources[name].provider=provider
     end
  end
 end

# this method does a put call to waf servers. This will be triggered with ensure is present and exists method return true.
def flush
  Puppet.debug("Calling  flush method of wafserverprovider: ")
  if @property_hash != {}
     login_instance = Login.new
     auth_header = login_instance.get_auth_header
     server_instance = SwaggerClient::ServerApi.new
     serverName=@resource[:name]
     serviceName=@resource[:service_name]
     Puppet.debug("WAF server name in manifest: #{serverName}")

     data,status_code,headers = server_instance.services_web_application_name_servers_server_name_put(auth_header,serviceName,serverName,message(resource),{})

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
  serverName=@resource[:name]
=begin
  opts = {
    "address-version"=> @resource[:address_version],
    "status"=> @resource[:status],
    "name"=>@resource[:name],
    "port"=> @resource[:port],
    "comments"=>@resource[:comments]
  }
=end
  if parameters.has_key?(:identifier) && parameters[:identifier] == "Hostname"
     hostname = nil
     if parameters.key?:hostname
       hostname = parameters[:hostname]
     else
       fail("hostname is required parameter in the manifest if identifier is set to hostname.")
     end

     if hostname.nil?
        fail("hostname is empty. Please add a valid hostname since the identifier is set to hostname.")
     else
       # opts["identifier"] = "Hostname"
       # opts["hostname"] = hostname
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
           #opts["identifier"] = "IP Address"
           #opts["ip-address"] = ip_address
            parameters[:identifier]="IP Address"
            parameters[:ip_address]=ip_address
        end
     else
       fail("ip_address is required parameter in the manifest.")
     end
  end

#  params=opts.to_json
  parameters.delete(:provider)
  parameters.delete(:ensure)
  parameters.delete(:loglevel)
  parameters.delete(:service_name)
  parameters=convert_underscores(parameters)
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
  Puppet.debug("Calling create method of wafserverprovider:")
  serviceName=@resource[:service_name]
  # getting the authorization token for WAF.
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  server_instance = SwaggerClient::ServerApi.new
  # getting token end
  result = server_instance.services_web_application_name_servers_post(auth_header,serviceName, message(resource),{})
  # We clear the hash here to stop flush from triggering.
  @property_hash.clear
  return result
end

# this method will call the delete api of a WAF service
def destroy
  Puppet.debug("Calling wafserverprovider destroy method: ")
  # getting the authorization token for WAF.
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  server_instance = SwaggerClient::ServerApi.new
  # getting token end
  serverName=@resource[:name]
  serviceName=@resource[:service_name]
  Puppet.debug("WAF server name in manifest: #{serverName}")
  response = server_instance.services_web_application_name_servers_server_name_delete(auth_header,serviceName,serverName,{})
  # We clear the hash here to stop flush from triggering.
  @property_hash.clear
  return response
end

end
