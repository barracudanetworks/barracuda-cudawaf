require_relative '../../../puppet_x/modules/login_info.rb'
require_relative '../../../puppet_x/swagger_client/configuration.rb'

require 'json'
require 'base64'
require 'uri'
require 'logger'
require 'rest-client'

Puppet::Type.type(:certificates).provide(:certificatesprovider) do

  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists methods of certificatesprovider:")
    @property_hash[:ensure] == :present

    name=@resource[:name]
    Puppet.debug("The cerName from manifest  #{name}")

    config = SwaggerClient::Configuration.new
    @config = config
    base_url = @config.base_url

    Puppet.debug("BaseURL in exists #{base_url}")

    # get the login instance for waf
    login_instance = Login.new
    auth_header = login_instance.get_auth_header

    # use rest client to build the request and payload to get the response
    response = RestClient.get base_url + "/certificates/" + "#{name}", {:Authorization => "#{auth_header}", accept: :json, content_type: :json} 

    Puppet.debug("Successful response from API: #{response}")

    if response
      return true
    end

    rescue => e
    Puppet.debug(" Response From API : #{e.response}")
    resp = JSON.parse(e.response)
    resp_status = resp['error']['status']
    Puppet.debug(" Response Status From API : #{resp_status}")

    # Typecast the status to integer
    if resp_status == "404" 
      return false
    else
      fail("Failing since couldn't understand the response. Status code from the response is #{resp_status}.")
    end
  end

  # this method will return the instances array
  def self.instances

    Puppet.debug("Inside self instances method")

    instances = []

    config = SwaggerClient::Configuration.new
    @config = config
    base_url = @config.base_url

    Puppet.debug("BaseURL in instances #{base_url}")

    login_instance = Login.new
    auth_header = login_instance.get_auth_header

    # get all certificates  from WAF
    response = RestClient.get base_url+"/certificates", {:Authorization => "#{auth_header}"}

    Puppet.debug("WAF certificates GET certificate name response : #{response}")

    parsed_response = JSON.parse(response)
    data = parsed_response["data"]

    data.each do |certObj|
      certificate_name = certObj['name']
      instances <<  new(
        :ensure => :present,
        :name => certObj['name'],
      )
    end

    Puppet.debug("instances : #{instances}")
    return instances
  end

  def self.prefetch(resources)
    Puppet.debug("Inside Self.Prefetch method of certificates provider")

    certificates = instances
    resources.keys.each do |name|
      if provider = certificates.find { |certificate| certificate.name == name}
        resources[name].provider=provider
      end    
    end
  end

  def flush
    Puppet.notice("def flush")
    Puppet.debug("inside flush method: there is no put call for waf certificates")
  end

  def message(object)
    upload = @resource[:upload]
    opts = {}

    type_resource = @resource.class
    params = object.to_hash
 
    if upload == 'signed'
      cert = @resource[:signed_certificate]
      key = @resource[:key]
      assign_key = @resource[:assign_associated_key]
      inter_cert = nil 

      if params.has_key?(:intermediary_certificate)
        inter_cert = @resource[:intermediary_certificate]
      end
 
      if not File.exists?(cert)
        fail("Failing since could not find the certificate file.")
      end

      if assign_key == "no"
        if not File.exists?(key)
          fail("Failing since could not find the key file.")
        end
      end

      unless inter_cert.nil?
        if not File.exists?(inter_cert)
          fail("Failing since could not locate intermediary certificate.")
        end
      end
    
      opts = {
        "allow_private_key_export" => @resource[:allow_private_key_export],
        "type" => @resource[:type],
        "key_type" => @resource[:key_type],
        "signed_certificate" => cert,
        "assign_associated_key" => assign_key,
        "key" => key,
        "intermediary_certificate" => inter_cert,
        "password" => @resource[:password],
        "name" => @resource[:name]
      }
    elsif upload == 'trusted'
      opts = {
        "name" => @resource[:name],
        "trusted_certificate" => @resource[:trusted_certificate]
      }
    elsif upload == 'trusted_server'
      opts = {
        "name" => @resource[:name],
        "trusted_server_certificate" => @resource[:trusted_server_certificate],
      }
    else
      opts = {
        "allow_private_key_export" => @resource[:allow_private_key_export],
        "city" => @resource[:city],
        "common_name" => @resource[:common_name],
        "country_code" => @resource[:country_code],
        "curve_type" => @resource[:curve_type],
        "key_size" => @resource[:key_size],
        "key_type" => @resource[:key_type],
        "name" => @resource[:name],
        "organization_name" => @resource[:organization_name],
        "organization_unit"=> @resource[:organization_unit],
        "state"=>@resource[:state]
      }.to_json 
    end

    return opts
  end

  def create
    Puppet.debug("WAF certificates create method: ")

    config = SwaggerClient::Configuration.new
    @config= config
    base_url = @config.base_url

    Puppet.debug("BaseURL in instances #{base_url}")

    # getting the authorization token for WAF.
    login_instance = Login.new
    auth_header = login_instance.get_auth_header

    payload = message(resource)

    Puppet.debug("Payload............ #{payload}")

    upload = @resource[:upload]
    url = base_url + "/certificates"

    if upload == "signed" || upload == "trusted" || upload == "trusted_server"
      url = url + "?upload=" + upload
    end

    if upload == "signed" 
      signed_payload = {
        :name => payload["name"],
        :signed_certificate => File.new(payload["signed_certificate"], 'rb'),
        :allow_private_key_export => payload["allow_private_key_export"],
        :type => payload["type"],
        :assign_associated_key => payload["assign_associated_key"],
        :key =>File.new(payload["key"], 'rb'),
        :password => payload["password"],
        :key_type => payload["key_type"],
        :multipart => true
      } 

      unless payload["intermediary_certificate"].nil?
        signed_payload[:intermediary_certificate] = File.new(payload["intermediary_certificate"], 'rb')
      end

      result = RestClient.post url, signed_payload, { :Authorization => "#{auth_header}" }

    elsif upload == "trusted"
      result = RestClient.post url, { 
        :name => payload["name"], 
        :trusted_certificate => File.new(payload["trusted_certificate"], 'rb'), 
        :multipart => true 
      }, 
      {
        :Authorization => "#{auth_header}"
      }
    elsif upload == "trusted_server"
      result = RestClient.post url, { 
        :name => payload["name"], 
        :trusted_server_certificate => File.new(payload["trusted_server_certificate"], 'rb'), 
        :multipart => true 
      }, 
      {
        :Authorization => "#{auth_header}"
      }
    else
      result = RestClient.post url, payload, {:Authorization => "#{auth_header}",content_type: :json,accept: :json}
    end

    Puppet.debug("WAF certificates POST method response:  #{result}")
    
    # Clear the hash here to stop flush from triggering.
    @property_hash.clear

    return result
  end

  def destroy
    Puppet.debug("Calling WAF certificates destroy method")

    config = SwaggerClient::Configuration.new
    @config = config
    base_url = @config.base_url

    Puppet.debug("BaseURL in instances #{base_url}")

    # getting the authorization token for WAF.
    login_instance = Login.new
    auth_header = login_instance.get_auth_header

    name = @resource[:name]

    Puppet.debug("certificate name is:  #{name}")

    response = RestClient.delete base_url + "/certificates/" + "#{name}", {:Authorization => "#{auth_header}",accept: :json}

    Puppet.debug("WAF certificates destroy method response: #{response}")

    # Clear the hash here to stop flush from triggering.
    @property_hash.clear

    return response
  end

end
