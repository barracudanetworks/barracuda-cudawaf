require_relative '../../../puppet_x/modules/security_policy/security_policy_api.rb'
require_relative '../../../puppet_x/modules/global_acl_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'

require 'json'
require 'base64'
require 'uri'
require 'logger'
Puppet::Type.type(:global_acl).provide(:global_aclprovider) do

  mk_resource_methods

  # this method will get server/servername and return true or false
  def exists?
    @property_hash[:ensure] == :present
  end


  #this method get all servers from WAF system and builds the instances array
  def self.instances()

    Puppet.debug("Calling self.instances method")
    instances = []
    policies = get_policies()

    #Puppet.debug("policies policies #{policies}")

    policies.each do |policy|
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      swagger_instance = SwaggerClient::GlobalACLApi.new

      # get all action policies for from WAF
      data, status_code, headers = swagger_instance.security_policies_policy_name_global_acls_get(auth_header, policy, {})
      Puppet.debug("WAF Get all Action Policies response:    #{data}")

      response = JSON.parse(data)
      Puppet.debug("parsed response object is #{response}")

      if !response.has_key?("data") then
        next
      end

      global_acl_data = response["data"]

      #Puppet.debug("The DATA:::::: #{global_acl_data}")

      if global_acl_data
        global_acl_data.each do |key, value|
          instances <<  new(
            :ensure => :present,
            :name => value["name"],
            :policy_name => response["Security Policy"],
            :action => value["action"],
            :comments => value["comments"],
            :deny_response => value["deny-response"],
            :enable => value["enable"],
            :extended_match => value["extended-match"],
            :extended_match_sequence => value["extended-match-sequence"],
            :follow_up_action => value["follow-up-action"],
            :follow_up_action_time => value["follow-up-action-time"],
            :redirect_url => value["redirect-url"],
            :response_page => value["response-page"],
            :url => value["url"],
          )
        end
      end
    end 
    return instances
  end

  def self.get_policies()
    Puppet.debug("Calling get_policies method")

    objects = []
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    
    #get all security policys from WAF
    security_policy_instance = SwaggerClient::SecurityPolicyApi.new
    data,status_code,headers = security_policy_instance.security_policies_get(auth_header, {})

    response = JSON.parse(data)
    data = response["data"]

    objects = data.keys
    return objects
  end


  # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug("Calling self.prefetch method")

    protected_data_types = instances

    resources.keys.each do |name|
      provider = protected_data_types.find do |global_acl|
        resources[name][:name].to_s == global_acl.name.to_s &&
        resources[name][:policy_name].to_s == global_acl.policy_name.to_s
      end
      resources[name].provider = provider unless provider.nil?
    end
  end

  # this method does a put call to waf servers. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug("Calling flush method")

    if @property_hash != {}
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      global_acl_instance = SwaggerClient::GlobalACLApi.new

      global_acl_name = @resource[:name]
      policy_name = @resource[:policy_name]
      Puppet.debug("WAF Security Policy name in manifest: #{policy_name} Global ACL Name : #{global_acl_name}")

      data, status_code, headers = global_acl_instance.security_policies_policy_name_global_acls_urlacl_name_put(auth_header, policy_name, global_acl_name, message(resource,"flush"), {})

      if status_code == 200
        return data
      else
        Puppet.debug("Could not update the configuration. status_code is #{status_code}")
        return
      end
    end
  end

  # this is a util method to build the JSON array to post the request to WAF
  def message(object, method)
    parameters = object.to_hash
    Puppet.debug("Parameters.......... #{parameters}")
    ruleName = @resource[:name]

    parameters.delete(:provider)
    parameters.delete(:ensure)
    parameters.delete(:loglevel)
    parameters.delete(:policy_name)
    parameters = convert_underscores(parameters)
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
    Puppet.debug("Calling create method")
    policy_name = @resource[:policy_name]

    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    global_acl_instance = SwaggerClient::GlobalACLApi.new

    data, status_code, headers = global_acl_instance.security_policies_policy_name_global_acls_post(auth_header, policy_name, message(resource,"create"), {})

    if status_code == 201
      @property_hash.clear
      return data
    else
      fail("Unable to create Data Theft Protection.")
    end
  end

  # this method will call the delete api of a WAF service
  def destroy
    Puppet.debug("Calling destroy method")

    name = @resource[:name]
    policy_name = @resource[:policy_name]

    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    global_acl_instance = SwaggerClient::GlobalACLApi.new

    response = global_acl_instance.security_policies_policy_name_global_acls_urlacl_name_delete(auth_header, policy_name, name, {})

    @property_hash.clear
    return response
  end

end
