require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/swagger_client/configuration.rb'

require 'json'
require 'base64'
require 'uri'
require 'logger'
require 'rest-client'

Puppet::Type.type(:cloudcontrol).provide(:cloudcontrolprovider) do

  Puppet.debug("Inside cloudcontrolprovider: ")

  mk_resource_methods

  # this method will get service/servicename and return true or false 
  def exists?
    Puppet.debug("Calling exists method of cloudcontrolprovider: ")
    @property_hash[:ensure] == :present
    return true
  end

  #this method get all services from WAF system and builds the instances array
  def self.instances
    Puppet.debug("Inside self instances method of cloud control provider")
    instances = []
    config = SwaggerClient::Configuration.new
    @config = config
    base_url = @config.base_url
    Puppet.debug("BaseURL in instances #{base_url}")
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    # get all certificates  from WAF
    response = RestClient.get base_url+"/control-center", {:Authorization => "#{auth_header}"}
    Puppet.debug("WAF cloud control GET response : #{response}")
    parsed_response = JSON.parse(response)
    Puppet.debug("Parsed...................... #{parsed_response}")
    cntrlObj = parsed_response["data"]
    Puppet.debug("Data.......... #{cntrlObj}")
   # data.each do |cntrlObj|
      Puppet.debug("OBJ.....#{cntrlObj}")
      state = cntrlObj['state']
      Puppet.debug("State .......#{state}")
      instances <<  new(
        :ensure => :present,
        :state => cntrlObj['state'],
        :connect_mode => 'connected',
        :username => cntrlObj['username'],
        :validation_token => cntrlObj['validation_token']
      )
    #end
    Puppet.debug("instances : #{instances}")
    return instances

  end

  # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug("Calling self.prefetch method of cloudcontrolprovider: ")
    cloudobj = instances
    resources.keys.each do |state|
      if provider = cloudobj.find { |cloud| cloud.state == state}
        resources[state].provider=provider
      end    
    end
  end

  # this method does a put call to waf service. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug("Calling  flush method of cloudcontrolprovider: ")
    if @property_hash != {}

      config = SwaggerClient::Configuration.new
      @config = config
      base_url = @config.base_url

      Puppet.debug("BaseURL in instances #{base_url}")

      login_instance = Login.new
      auth_header = login_instance.get_auth_header

      Puppet.debug("WAF authorization token:  #{auth_header}")
      base = base_url+"/control-center"
      connect_mode =@resource['connect_mode']
      response = RestClient.put base, {
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
  def destroy
    Puppet.debug("Calling cloudcontrolprovider destroy method: ")

    config = SwaggerClient::Configuration.new
    @config = config
    base_url = @config.base_url

    Puppet.debug("BaseURL in instances #{base_url}")

    login_instance = Login.new
    auth_header = login_instance.get_auth_header

    Puppet.debug("WAF authorization token:  #{auth_header}")

    response = RestClient.put base_url + "/control-center", {
      :connect_mode => @resource["connect_mode"],
      :state => 'not_connected',
      :username => @resource["username"],
      :password => @resource["password"],
    }, {:Authorization => "#{auth_header}", accept: :json, content_type: :json}

    Puppet.debug("Successful response from API: #{response}")

    # Clear the hash here to stop flush from triggering.
    @property_hash.clear

    return response
  end

end
