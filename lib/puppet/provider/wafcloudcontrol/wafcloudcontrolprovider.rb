require_relative '../../../puppet_x/modules/service_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'

require 'json'
require 'base64'
require 'uri'
require 'logger'
require 'rest-client'
Puppet::Type.type(:wafcloudcontrol).provide(:wafcloudcontrolprovider) do
  Puppet.debug("Inside wafcloudcontrolprovider: ")
  mk_resource_methods

# this method will get service/servicename and return true or false 
def exists?
  Puppet.debug("Calling exists method of wafcloudcontrolprovider: ")
  @property_hash[:ensure] == :present
  return true
end

#this method get all services from WAF system and builds the instances array
def self.instances
  Puppet.debug("Callling self.instances method of wafcloudcontrolprovider: ")
  instances = []
  return instances
end

# this method compares the name attribute from instances and resources. If it matches then sets the provider
def self.prefetch(resources)
  Puppet.debug("Calling self.prefetch method of wafcloudcontrolprovider: ")
  cloudobj = instances
  resources.keys.each do |state|
     if provider = cloudobj.find { |cloud| cloud.state == state}
     resources[state].provider=provider
     end    
  end
end

# this method does a put call to waf service. This will be triggered with ensure is present and exists method return true.
def flush
  Puppet.debug("Calling  flush method of wafcloudcontrolprovider: ")
  if @property_hash != {}
     login_instance = Login.new
     auth_header = login_instance.get_auth_header
     Puppet.debug("WAF authorization token:  #{auth_header}")
     response = RestClient.put "http://10.36.73.244:8000/restapi/v3/control-center", {
       "connect_mode" => @resource["connect_mode"],
       "state" => "connected",
       "username" => @resource["username"],
       "password" => @resource["password"]
     }.to_json, {:Authorization => "#{auth_header}", accept: :json, content_type: :json}
     Puppet.debug("Successful response from API: #{response}")
  end    
  return response
end

# this method does not do anything for cloudcontrol
def create
  Puppet.debug("Calling create method of wafclouodcontrolprovider:")
  # We clear the hash here to stop flush from triggering.
  @property_hash.clear
end

# this method does not do anything for cloudcontrol 
def destroy
  Puppet.debug("Calling wafcloudcontrolprovider destroy method: ")
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  Puppet.debug("WAF authorization token:  #{auth_header}")
  response = RestClient.put "http://10.36.73.244:8000/restapi/v3/control-center", {
    :connect_mode => @resource["connect_mode"],
    :state => 'not_connected',
    :username => @resource["username"],
    :password => @resource["password"],
  }, {:Authorization => "#{auth_header}", accept: :json, content_type: :json}

  Puppet.debug("Successful response from API: #{response}")

  # We clear the hash here to stop flush from triggering.
  @property_hash.clear
  return response
end

end
