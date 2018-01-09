require_relative '../../../puppet_x/modules/security_policy/security_policy_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/modules/security_policy/security_policy_url_normalization_api.rb'
require 'json'
require 'base64'
require 'logger'
require 'uri'

Puppet::Type.type(:security_policy_url_normalization).provide(:security_policy_url_normalizationprovider) do
  Puppet.debug("Inside security_policy_url_normalizationprovider: ")
  mk_resource_methods

 # this method will get security_policy_url_normalization and return true or false 

  def exists?
    Puppet.debug("Calling exists method of security_policy_url_normalizationprovider: ")
    @property_hash[:ensure] == :present
  end

 #this method get all secuirty policys from WAF system and builds the instances array 

  def self.instances

    Puppet.debug("Calling instances method of security_policy_url_normalizationprovider: ")
    instances = []
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    security_policy_instance = SwaggerClient::SecurityPolicyApi.new
    # get all security_policy_url_normalization from WAF
    data,status_code,headers = security_policy_instance.security_policies_get(auth_header,{})
    Puppet.debug("WAF Get all security_policy_url_normalization response:    #{data}")
    unless data == '{}'
      if status_code == 200
         response = JSON.parse(data)
         policyobj = response["object"]
         Puppet.debug("Object is  #{policyobj}")
         policyData = response["data"]
         Puppet.debug("Service  data:  #{policyData}")
         policyData.each do |key,value|
           policyName=value["name"]
           val= value["URL Normalization"]
           instances <<  new(
           :ensure => :present,
           :name => policyName,
           :apply_double_decoding => val["apply-double-decoding"],
           :default_charset => val["default-charset"],
           :detect_response_charset => val["detect-response-charset"],
           :parameter_separators => val["parameter-separators"]
           )
        end
      end # if end
    end# unless end
    return instances
  end

 # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug("Calling prefetch method of security_policy_url_normalizationprovider: ")
    secuirty_policies = instances
    resources.keys.each do |name|
      if provider = secuirty_policies.find { |secuirty_policy| secuirty_policy.name == name}
         resources[name].provider=provider
      end
    end
  end

 # this method does a put call to wafsecurity_policy_url_normalization. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug("Calling flush method of security_policy_url_normalizationprovider: ")
    if @property_hash != {}
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      security_policy_url_nrml_instance = SwaggerClient::SecurityPolicyUrlNormalizationApi.new
      policyName=@resource[:name]
      data,status_code,headers= security_policy_url_nrml_instance.security_policies_policy_name_url_normalization_put(auth_header,policyName,message(resource),{})
      Puppet.debug("WAF services PUT response:  #{data}")
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

 # util method to refactor the underscores
  def convert_underscores(hash)
    hash.each_with_object({}) do |(k ,v), obj|
      key = k.to_s.gsub(/_/, '-').to_sym
      obj[key] = v

    end
  end

 # this method does a POST call to create a security_policy_url_normalization in WAF.this method will be called if the ensure is present and exists method return false 
  def create
    Puppet.debug("Calling create method of security_policy_url_normalizationprovider: ")
  end

# this method will call the delete api of a WAF security_policy_url_normalization 
  def destroy
    Puppet.debug("Calling destroy method of security_policy_url_normalizationprovider: ")
  end

end

