require_relative '../../../puppet_x/modules/service/service_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/modules/service/authentication_api.rb'
require 'json'
require 'base64'
require 'logger'
require 'uri'
#require 'rest-client'

Puppet::Type.type(:service_authentication).provide(:service_authenticationprovider) do

  Puppet.debug("Inside service_authenticationprovider: ")

  mk_resource_methods

def exists?
  Puppet.debug("Calling exists method of service_authenticationprovider: ")
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
   service_auth_instance=SwaggerClient::AuthenticationApi.new   
# get all servers from WAF
   data,status_code,headers = service_auth_instance.services_web_application_name_authentication_get(auth_header,serviceName,{})
   Puppet.debug("WAF Get all servers response:    #{data}")

   response = JSON.parse(data)
   Puppet.debug("parsed response object is #{response}")
   svrData =response["data"]
   serviceName = response["Service"]
   Puppet.debug("The DATA =======>>> #{svrData}")
   if svrData
     svrData.each do |key,value|
        Puppet.debug("VALUE... =======>>> #{value}")
       servname = value["name"]
       val = value["Authentication"]
       Puppet.debug("VAL is ... #{val}")
       instances <<  new(
          :ensure => :present,
          :name => servname,
          :login_page => val["login-page"],
          :dual_login_page => val["dual-login-page"],
          :service_provider_org_name => val["service-provider-org-name"],
          :kerberos_spn => val["kerberos-spn"],
          :login_failed_page => val["login-failed-page"],
          :signing_certificate => val["signing-certificate"],
          :login_processor_path => val["login-processor-path"],
          :count_window => val["count-window"],
          :service_provider_entity_id => val["service-provider-entity-id"],
          :cookie_domain => val["cookie-domain"],
          :send_domain_name => val["send-domain-name"],
          :login_successful_page => val["login-successful-page"],
          :session_timeout_for_activesync => val["session-timeout-for-activesync"],
          :groups => val["groups"],
          :service_provider_display_name => val["service-provider-display-name"],
          :master_service_url => val["master-service-url"],
          :encryption_certificate => val["encryption-certificate"],
          :authentication_service => val["authentication-service"],
          :logout_successful_page => val["logout-successful-page"],
          :challenge_user_field => val["challenge-user-field"],
          :logout_page => val["logout-page"],
          :access_denied_page => val["access-denied-page"],
          :master_service => val["master-service"],
          :cookie_path => val["cookie-path"],
          :login_challenge_page => val["login-challenge-page"],
          :service_provider_org_url => val["service-provider-org-url"],
          :idle_timeout => val["idle-timeout"],
          :password_expired_url => val["password-expired-url"],
          :status  => val["status"],
          :post_processor_path => val["post-processor-path"],
          :dual_authentication => val["dual-authentication"],
          :sso_cookie_update_interval => val["sso-cookie-update-interval"],
          :challenge_prompt_field => val["challenge-prompt-field"],
          :max_failed_attempts => val["max-failed-attempts"],
          :enable_bruteforce_prevention => val["enable-bruteforce-prevention"],
          :creation_timeout => val["creation-timeout"],
          :kerberos_enable_delegation => val["kerberos-enable-delegation"],
          :secondary_authentication_service => val["secondary-authentication-service"],
          :action => val["action"],
          :kerberos_debug_status => val["kerberos-debug-status"],
          :logout_processor_path => val["logout-processor-path"]
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
  Puppet.debug("Calling prefetch method of service_authenticationprovider: ")
  services = instances
  resources.keys.each do |name|
    if provider = services.find { |service| service.name == name}
       resources[name].provider=provider
    end
  end
end

def flush
  Puppet.debug("Calling flush method of service_authenticationprovider: ")
    if @property_hash != {}
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      service_auth_instance = SwaggerClient::AuthenticationApi.new
      svcName=@resource[:name]
      data,status_code,headers= service_auth_instance.services_web_application_name_authentication_put(auth_header,svcName,message(resource),{})
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
  Puppet.debug("Calling create method of service_authenticationprovider: ")
end

def destroy
  Puppet.debug("Calling destroy method of service_authenticationprovider: ")
end


end

