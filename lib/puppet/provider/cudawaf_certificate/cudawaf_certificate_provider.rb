require 'puppet_x/modules/login_info'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_certificate).provide(:cudawaf_certificate_provider, parent: Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  def exists?
    Puppet.debug(self.class.to_s.split('::').last + ': Calling exists method : ')
    @property_hash[:ensure] == :present

    response = Puppet::Provider::Cudawaf.client_get '/certificates/' + @resource[:name]

    return true if response
  rescue StandardError => e
    resp = JSON.parse(e.response)
    resp_status = resp['error']['status']
    Puppet.debug(self.class.to_s.split('::').last + ":  Response Status From API : #{resp_status}")

    if resp_status == '404'
      return false
    else
      raise(self.class.to_s.split('::').last + ": Failing since couldn't understand the response. Status code from the response is #{resp_status}.")
    end
  end

  # this method will return the instances array
  def self.instances
    Puppet.debug(self.to_s.split('::').last + ': Calling self instances method')
    instances = []

    # get all Certificates  from WAF
    response = Puppet::Provider::Cudawaf.client_get '/certificates'
    Puppet.debug(self.to_s.split('::').last + ": GET certificate name response : #{response}")
    data = response['data']

    data.each do |certObj|
      certificate_name = certObj['name']
      instances << new(
        ensure: :present,
        name: certObj['name']
      )
    end

    instances
  end

  def self.prefetch(resources)
    Puppet.debug(self.to_s.split('::').last + ': Calling self prefetch method : ')
    certificates = instances
    resources.keys.each do |name|
      if provider = certificates.find { |certificate| certificate.name == name }
        resources[name].provider = provider
      end
    end
  end

  def message(object)
    upload = @resource[:upload].to_s unless @resource[:upload].nil?

    opts = {}

    type_resource = @resource.class
    params = object.to_hash

    if upload == 'signed'
      cert = @resource[:signed_certificate]
      key = @resource[:key]
      assign_key = @resource[:assign_associated_key]
      inter_cert = nil

      if params.key?(:intermediary_certificate)
        inter_cert = @resource[:intermediary_certificate]
      end

      unless File.exist?(cert)
        raise(self.class.to_s.split('::').last + ': Failing since could not find the certificate file.')
      end

      if assign_key == 'no'
        unless File.exist?(key)
          raise(self.class.to_s.split('::').last + ': Failing since could not find the key file.')
        end
      end

      unless inter_cert.nil?
        unless File.exist?(inter_cert)
          raise(self.class.to_s.split('::').last + ': Failing since could not locate intermediary certificate.')
        end
      end

      opts = {
        'allow_private_key_export' => @resource[:allow_private_key_export],
        'type' => @resource[:type],
        'key_type' => @resource[:key_type],
        'signed_certificate' => cert,
        'assign_associated_key' => assign_key,
        'key' => key,
        'intermediary_certificate' => inter_cert,
        'password' => @resource[:password],
        'name' => @resource[:name]
      }
    elsif upload == 'trusted'
      opts = {
        'name' => @resource[:name],
        'trusted_certificate' => @resource[:trusted_certificate]
      }
    elsif upload == 'trusted_server'
      opts = {
        'name' => @resource[:name],
        'trusted_server_certificate' => @resource[:trusted_server_certificate]
      }
    else
      opts = {
        'allow_private_key_export' => @resource[:allow_private_key_export],
        'city' => @resource[:city],
        'common_name' => @resource[:common_name],
        'country_code' => @resource[:country_code],
        'curve_type' => @resource[:curve_type],
        'key_size' => @resource[:key_size],
        'key_type' => @resource[:key_type],
        'name' => @resource[:name],
        'organization_name' => @resource[:organization_name],
        'organization_unit' => @resource[:organization_unit],
        'state' => @resource[:state]
      }.to_json
    end

    opts
  end

  def create
    Puppet.debug(self.class.to_s.split('::').last + ': Calling create method : ')

    payload = message(resource)
    upload = ''

    upload = @resource[:upload].to_s unless @resource[:upload].nil?

    url = '/certificates'
    if upload == 'signed' || upload == 'trusted' || upload == 'trusted_server'
      url = url + '?upload=' + upload
    end

    if upload == 'signed'
      signed_payload = {
        name: payload['name'],
        signed_certificate: File.new(payload['signed_certificate'], 'rb'),
        allow_private_key_export: payload['allow_private_key_export'],
        type: payload['type'],
        assign_associated_key: payload['assign_associated_key'],
        key: File.new(payload['key'], 'rb'),
        password: payload['password'],
        key_type: payload['key_type'],
        multipart: true
      }

      unless payload['intermediary_certificate'].nil?
        signed_payload[:intermediary_certificate] = File.new(payload['intermediary_certificate'], 'rb')
      end

      response = Puppet::Provider::Cudawaf.client_post url, signed_payload
    elsif upload == 'trusted'
      response = Puppet::Provider::Cudawaf.client_post url,
                                                       name: payload['name'],
                                                       trusted_certificate: File.new(payload['trusted_certificate'], 'rb'),
                                                       multipart: true
    elsif upload == 'trusted_server'
      response = Puppet::Provider::Cudawaf.client_post url,
                                                       name: payload['name'],
                                                       trusted_server_certificate: File.new(payload['trusted_server_certificate'], 'rb'),
                                                       multipart: true
    else
      response = Puppet::Provider::Cudawaf.client_post url, payload
    end

    Puppet.debug(self.class.to_s.split('::').last + ": POST method response:  #{response}")

    # Clear the hash here to stop flush from triggering.
    @property_hash.clear

    response
  end

  def destroy
    Puppet.debug(self.class.to_s.split('::').last + ': Calling destroy method : ')

    response = Puppet::Provider::Cudawaf.client_delete '/certificates/' + @resource[:name]
    Puppet.debug(self.class.to_s.split('::').last + ": DELETE method response: #{response}")

    # Clear the hash here to stop flush from triggering.
    @property_hash.clear

    response
  end
end
