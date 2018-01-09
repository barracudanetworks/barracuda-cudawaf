require_relative '../../../puppet_x/modules/security_policy/security_policy_api.rb'
require_relative '../../../puppet_x/modules/action_policy_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'

require 'json'
require 'base64'
require 'uri'
require 'logger'
Puppet::Type.type(:action_policy).provide(:action_policyprovider) do

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

    Puppet.debug("policies policies #{policies}")

    policies.each do |policy|
 
      login_instance = Login.new
      auth_header = login_instance.get_auth_header
      swagger_instance = SwaggerClient::ActionPolicyApi.new

      # get all action policies for from WAF
      data, status_code, headers = swagger_instance.security_policies_policy_name_action_policies_get(auth_header, policy, {})
      Puppet.debug("WAF Get all Action Policies response:    #{data}")

      response = JSON.parse(data)
      Puppet.debug("parsed response object is #{response}")

      if !response.has_key?("data") then
        next
      end

      action_policy_data = response["data"]

      #Puppet.debug("The DATA:::::: #{action_policy_data}")

      if action_policy_data
        action_policy_data.each do |key, value|
          instances <<  new(
            :ensure => :present,
            :name => value["name"],
            :policy_name => response["Security Policy"],
            :action => value["action"],
            :deny_response => value["deny-response"],
            :follow_up_action => value["follow-up-action"],
            :follow_up_action_time => value["follow-up-action-time"],
            :numeric_id => value["numeric-id"],
            :redirect_url => value["redirect-url"],
            :response_page => value["response-page"],
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

    action_policies = instances

    resources.keys.each do |name|
      provider = action_policies.find do |action_policy|
        resources[name][:name].to_s == action_policy.name.to_s &&
        resources[name][:policy_name].to_s == action_policy.policy_name.to_s
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
      action_policy_instance = SwaggerClient::ActionPolicyApi.new

      action_policy_name = @resource[:name]
      policy_name = @resource[:policy_name]
      Puppet.debug("WAF Security Policy name in manifest: #{policy_name} Action Policy Name : #{action_policy_name}")

      data, status_code, headers = action_policy_instance.security_policies_policy_name_action_policies_attack_action_name_put(auth_header, policy_name, action_policy_name, message(resource,"flush"), {})

      if status_code == 200
        return data
      else
        Puppet.debug("There is some problem to process the request. status_code is #{status_code}")
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
  end

  # this method will call the delete api of a WAF service
  def destroy
    Puppet.debug("Calling destroy method")
  end

end
