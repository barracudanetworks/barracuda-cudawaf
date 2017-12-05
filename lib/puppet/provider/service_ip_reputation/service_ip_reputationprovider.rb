require_relative '../../../puppet_x/modules/service/service_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/modules/service/ip_reputation_api.rb'
require 'json'
require 'base64'
require 'logger'
require 'uri'

Puppet::Type.type(:service_ip_reputation).provide(:service_ip_reputationprovider) do
  Puppet.debug("Inside service_ip_reputationprovider: ")
  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists method of service_ip_reputationprovider: ")
    @property_hash[:ensure] == :present

    # getting waf authorization token
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    Puppet.debug("WAF authorization token:  #{auth_header}")
    service_iprep_instance = SwaggerClient::IpReputationApi.new
    #call get service_ip_reputation
    svcName=@resource[:name]
    Puppet.debug("WAF service name in manifest:  #{svcName}")
    data,status_code,headers=service_iprep_instance.services_web_application_name_ip_reputation_get(auth_header,svcName)
    if status_code == 200
       true
    elsif status_code == 404
      false
    else
      fail("Not able to process the request. Pleae check your request parameters.")
    end
  end


  def self.instances
    Puppet.debug("Calling instances method of service_ip_reputationprovider: ")
    instances = []
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    service_instance = SwaggerClient::ServiceApi.new
    # get all service_ip_reputation from WAF
    data,status_code,headers = service_instance.services_get(auth_header,{})
    Puppet.debug("WAF Get all service_ip_reputation response:    #{data}"
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


  def self.prefetch(resources)
    Puppet.debug("Calling prefetch method of service_ip_reputationprovider: ")
    services = instances
    resources.keys.each do |name|
		if provider = services.find { |service| service.name == name}
		   resources[name].provider=provider
		end
    end
  end

  def flush
    Puppet.debug("Calling flush method of service_ip_reputationprovider: ")
    if @property_hash != {}
		login_instance = Login.new
		auth_header = login_instance.get_auth_header
                service_iprep_instance = SwaggerClient::IpReputationApi.new
		svcName=@resource[:name]
		data,status_code,headers= service_iprep_instance.services_web_application_name_ip_reputation_put(auth_header,svcName,message(resource),{})
		Puppet.debug("WAF services PUT response:  #{data}"
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
    Puppet.debug("Calling create method of service_ip_reputationprovider: ")
=begin
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    service_instance = SwaggerClient::ServiceApi.new
    svcName=@resource[:name]
    data,status_code,headers= service_instance.services_web_application_name_put(auth_header,svcName,message(resource),{})
    Puppet.debug("WAF services CREATE response:  #{data}"
    if status_code == 201
      @property_hash.clear
      return data
    else
      fail("Not able to create the service. Please check the service api parameters")
    end
=end
  end

  def destroy
    Puppet.debug("Calling destroy method of service_ip_reputationprovider: ")
=begin
    login_instance = Login.new
    auth_header = login_instance.get_auth_header
    service_instance = SwaggerClient::ServiceApi.new
    svcName=@resource[:name]
    data,status_code,headers= service_instance.services_web_application_name_put(auth_header,svcName,message(resource),{})
      @property_hash.clear
      return data
=end
  end
end
