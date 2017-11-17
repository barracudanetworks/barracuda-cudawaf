require_relative '../../../puppet_x/modules/service_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'

require 'json'
require 'base64'
require 'uri'
require 'logger'
require 'rest-client'
Puppet::Type.type(:services).provide(:serviceprovider) do

  Puppet.debug("Inside serviceprovider: ")

  mk_resource_methods

# this method will get service/servicename and return true or false 
def exists?
  Puppet.debug("Calling exists method of serviceprovider: ")
  @property_hash[:ensure] == :present

  # getting waf authorization token
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  Puppet.debug("WAF authorization token:  #{auth_header}")
  service_instance = SwaggerClient::ServiceApi.new

# call get service

  svcName=@resource[:name]
  Puppet.debug("WAF service name in manifest:  #{svcName}")
  response=service_instance.services_web_application_name_get(auth_header,svcName)
  parsed_response = JSON.parse(response)
  status_code=parsed_response["status_code"]
  Puppet.debug("status_code received from WAF api GET service:  #{status_code}")

  if response.to_s.empty?
    fail("Not able to process the request. Please check the request parameters")
  end

  if status_code === '200'
     true
  elsif status_code === '404'
     false
  else
    fail("Not able to process the request. Pleae check your request parameters.")
  end
# get service call ends

end

#this method get all services from WAF system and builds the instances array
def self.instances

  Puppet.debug("Calling self.instances method of serviceprovider: ")
  instances = []

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
      Puppet.debug("Service  data:  #{svcData}")
      svcData.each do |key,value|
        val= value
        instances <<  new(
          :ensure => :present,
          :name => val["name"],
        ) 
      end
   end # if end
 end  # unless end
 return instances

end

# this method compares the name attribute from instances and resources. If it matches then sets the provider
def self.prefetch(resources)

  Puppet.debug("Calling self.prefetch method of serviceprovider: ")
  services = instances
  resources.keys.each do |name|
     if provider = services.find { |service| service.name == name}
     resources[name].provider=provider
     end    
  end

end

# this method does a put call to waf service. This will be triggered with ensure is present and exists method return true.
def flush
  Puppet.debug("Calling  flush method of serviceprovider: ")
  if @property_hash != {}
     login_instance = Login.new
     auth_header = login_instance.get_auth_header
     service_instance = SwaggerClient::ServiceApi.new
     svcName=@resource[:name]
     Puppet.debug("WAF service name in manifest: #{svcName}")     
     response= service_instance.services_web_application_name_put(auth_header,svcName,message(resource),{})
     Puppet.debug("WAF services PUT response:  #{response}")
  end    
  return response
end

# this is a util method to build the JSON array to post the request to WAF
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


# this method does a POST call to create a service in WAF.this method will be called if the ensure is present and exists method return false
def create
  Puppet.debug("Calling create method of serviceprovider:")

  # getting the authorization token for WAF.
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  service_instance = SwaggerClient::ServiceApi.new
  # getting token end
  data,status_code,headers =  result = service_instance.services_post_with_http_info(auth_header, message(resource),{})
  Puppet.debug("SERVICE CREATE - STATUS Code is #{status_code}")
  
  if status_code == 201
     @property_hash.clear
     return result
  else
    fail("Not able to create the service. Please check the service api parameters")
  end
  # We clear the hash here to stop flush from triggering.
  #@property_hash.clear
  #return result
end

# this method will call the delete api of a WAF service 
def destroy
  Puppet.debug("Calling serviceprovider destroy method: ")
  # getting the authorization token for WAF.
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  service_instance = SwaggerClient::ServiceApi.new
  # getting token end
  svcName=@resource[:name]
  Puppet.debug("WAF service name in manifest: #{svcName}")
  response = service_instance.services_web_application_name_delete(auth_header,svcName,{})   
  # We clear the hash here to stop flush from triggering.
  @property_hash.clear
  return response
end

end
