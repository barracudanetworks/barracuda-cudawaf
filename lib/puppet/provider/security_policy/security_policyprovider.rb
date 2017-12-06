require_relative '../../../puppet_x/modules/security_policy/security_policy_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:security_policy).provide(:security_policyprovider) do

  Puppet.debug("Inside security_policyprovider: ")

  mk_resource_methods

# this method will get security policy/security policyname and return true or false
def exists?
  Puppet.debug("Calling exists method of security_policyprovider: ")
  @property_hash[:ensure] == :present

  # getting waf authorization token
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  Puppet.debug("WAF authorization token:  #{auth_header}")
  security_policy_instance = SwaggerClient::SecurityPolicyApi.new

# call get security policy

  policyName=@resource[:name]
  Puppet.debug("WAF security policy name in manifest:  #{policyName}")
  data, status_code, headers = security_policy_instance.security_policies_policy_name_get(auth_header,policyName)
 # parsed_response = JSON.parse(response)
 # status_code=parsed_response["status_code"]
  Puppet.debug("status_code received from WAF api GET security policy:  #{status_code}")

  if data.to_s.empty?
    fail("Not able to process the request. Please check the request parameters")
  end

  if status_code == 200
     true
  elsif status_code == 404
     false
  else
    fail("Not able to process the request. Please check your request parameters----------.")
  end
# get security policy call ends

end

#this method get all security policys from WAF system and builds the instances array
def self.instances

  Puppet.debug("Calling self.instances method of security_policyprovider: ")
  instances = []

  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  Puppet.debug(" auth header;;;;;;;;;;;;;; #{auth_header}")
  security_policy_instance = SwaggerClient::SecurityPolicyApi.new

# get all security policys from WAF
  data,status_code,headers = security_policy_instance.security_policies_get(auth_header,{})
  Puppet.debug("WAF Get all security policy response:    #{data}")
  unless data == '{}'
    if status_code == 200
      response = JSON.parse(data)
      policyobj = response["object"]
      Puppet.debug("Object is  #{policyobj}")
      policyData = response["data"]
      Puppet.debug("security policy  data:  #{policyData}")
      policyData.each do |key,value|
        val = value
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

  Puppet.debug("Calling self.prefetch method of security_policyprovider: ")
  security_policies = instances
  resources.keys.each do |name|
     if provider = security_policies.find { |security_policy| security_policy.name == name}
     resources[name].provider=provider
     end
  end

end

# this method does a put call to waf security policy. This will be triggered with ensure is present and exists method return true.
def flush
  Puppet.debug("Calling  flush method of security_policyprovider: ")
  if @property_hash != {}
     login_instance = Login.new
     auth_header = login_instance.get_auth_header
     security_policy_instance = SwaggerClient::SecurityPolicyApi.new
     policyName=@resource[:name]
     Puppet.debug("WAF security policy name in manifest: #{policyName}")
     data, status_code, headers = security_policy_instance.security_policies_policy_name_put(auth_header,policyName,message(resource),{})
     Puppet.debug("WAF security policys PUT response:  #{data}")
  end
  return data
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


# this method does a POST call to create a security policy in WAF.this method will be called if the ensure is present and exists method return false
def create
  Puppet.debug("Calling create method of security_policyprovider:")

  # getting the authorization token for WAF.
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  security_policy_instance = SwaggerClient::SecurityPolicyApi.new
  # getting token end
  data,status_code,headers = security_policy_instance.security_policies_post(auth_header, message(resource),{})
  Puppet.debug("security policy CREATE - STATUS Code is #{status_code}")

  if status_code == 201
     @property_hash.clear
     return data
  else
    fail("Not able to create the security policy. Please check the security policy api parameters")
  end
  # We clear the hash here to stop flush from triggering.
  #@property_hash.clear
  #return result
end

# this method will call the delete api of a WAF security policy
def destroy
  Puppet.debug("Calling securitypolicy_provider destroy method: ")
  # getting the authorization token for WAF.
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  security_policy_instance = SwaggerClient::SecurityPolicyApi.new
  # getting token end
  policyName=@resource[:name]
  Puppet.debug("WAF security policy name in manifest: #{policyName}")
  data, status_code, headers = security_policy_instance.security_policies_policy_name_delete(auth_header,policyName,{})
  # We clear the hash here to stop flush from triggering.
  @property_hash.clear
  return data
end

end

