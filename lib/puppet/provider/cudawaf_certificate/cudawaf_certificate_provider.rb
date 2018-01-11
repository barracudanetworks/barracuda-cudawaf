require 'puppet_x/modules/login_info'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_certificate).provide(:cudawaf_certificate_provider, :parent => Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  def exists?
    Puppet.debug("Calling exists methods of cudawaf_certificate_provider:")
    @property_hash[:ensure] == :present

    response = Puppet::Provider::Cudawaf.client_get "/certificates/" + @resource[:name]

    if response
      return true
    end

    rescue => e
    resp = JSON.parse(e.response)
    resp_status = resp['error']['status']
    Puppet.debug(" Response Status From API : #{resp_status}")

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

    # get all Certificates  from WAF
    response = Puppet::Provider::Cudawaf.client_get "/certificates"
    Puppet.debug("WAF certificates GET certificate name response : #{response}")
    data = response["data"]

    data.each do |certObj|
      certificate_name = certObj['name']
      instances <<  new(
        :ensure => :present,
        :name => certObj['name']
      )
    end

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

  def message(object)
    unless @resource[:upload].nil? 
      upload = @resource[:upload].to_s
    end
   
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

    payload = message(resource)
    upload = ""

    unless @resource[:upload].nil? 
      upload = @resource[:upload].to_s
    end

    url = "/certificates"
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

      response = Puppet::Provider::Cudawaf.client_post url, signed_payload
    elsif upload == "trusted"
      response = Puppet::Provider::Cudawaf.client_post url, { 
        :name => payload["name"], 
        :trusted_certificate => File.new(payload["trusted_certificate"], 'rb'), 
        :multipart => true 
      }
    elsif upload == "trusted_server"
      response = Puppet::Provider::Cudawaf.client_post url, { 
        :name => payload["name"], 
        :trusted_server_certificate => File.new(payload["trusted_server_certificate"], 'rb'), 
        :multipart => true 
      }
    else
      response = Puppet::Provider::Cudawaf.client_post url, payload
    end

    Puppet.debug("WAF certificates POST method response:  #{response}") 

    # Clear the hash here to stop flush from triggering.
    @property_hash.clear

    return response
  end

  def destroy
    Puppet.debug("Calling WAF certificates destroy method")

    response = Puppet::Provider::Cudawaf.client_delete "/certificates/" + @resource[:name]
    Puppet.debug("WAF certificates destroy method response: #{response}")

    # Clear the hash here to stop flush from triggering.
    @property_hash.clear

    return response
  end

end
