require 'puppet_x/modules/login_info'
require 'puppet_x/modules/utils'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'
require 'rest-client'

Puppet::Type.type(:cudawaf_server).provide(:cudawaf_server_provider, parent: Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  def initialize(value = {})
    super(value)
    @property_flush = {}
  end

  # this method will get server/servername and return true or false
  def exists?
    Puppet.debug(self.class.to_s.split('::').last + ": Calling exists method for : #{@resource[:name]}")
    @property_hash[:ensure] == :present
  end

  # this method get all servers from WAF system and builds the instances array
  def self.instances
    services = getservices
    Puppet.debug(to_s.split('::').last + ": List of services .................. #{services}")
    instances = []

    services.each do |service|
      serviceName = service

      # get all servers from WAF
      response, status_code, headers = Puppet::Provider::Cudawaf.get('Server', serviceName, {})
      Puppet.debug(to_s.split('::').last + ": WAF Get all servers response:    #{response}")

      svrData = response['data']
      serviceName = response['Service']
      next unless svrData
      svrData.each do |_key, val|
        servname = val['name']
        instances << new(
          ensure: :present,
          name: val['name'],
          service_name: response['Service'],
          address_version: val['address-version'],
          status: val['status'],
          hostname: val['hostname'],
          comments: val['comments'],
          port: val['port'],
          identifier: val['identifier'],
          ip_address: val['ip-address']
        )
      end
    end # do end services

    instances
  end

  # this method get all services from WAF system and builds the instances array
  def self.getservices
    Puppet.debug(to_s.split('::').last + ': Calling getservices method : ')
    service_instances = []

    # get all services from WAF
    response, status_code, headers = Puppet::Provider::Cudawaf.get('Service', {})
    Puppet.debug(to_s.split('::').last + ": WAF Get all services response:    #{response}")

    unless response.nil?
      if status_code == 200
        svcData = response['data']
        unless svcData.nil?
          svcData.each do |_key, value|
            service_instances.push(value['name'])
          end
        end # unless svcData check
      end # if end
    end # unless end

    service_instances
  end

  def self.prefetch(resources)
    servers = instances
    resources.keys.each do |name|
      provider = servers.find do |server|
        resources[name][:name].to_s == server.name.to_s &&
          resources[name][:service_name].to_s == server.service_name.to_s
      end

      resources[name].provider = provider unless provider.nil?
    end
  end # self.prefetch

  # this method does a put call to waf servers. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug(self.class.to_s.split('::').last + ': Calling flush method : ')
    if @property_hash != {}
      response, status_code, headers = Puppet::Provider::Cudawaf.put('Server', @resource[:service_name], @resource[:name], message(resource, 'PUT'), {})

      if status_code == 200
        return response, status_code, headers
      else
        Puppet.debug(self.class.to_s.split('::').last + ": There is some problem to process the request. status_code is #{status_code}")
        return
      end
    end
  end

  # Returns a property of the resource
  # Override magic method created by mk_resource_methods
  def version
    @property_hash[:version]
  end

  # Update a property of the resource
  # Override magic method created by mk_resource_methods
  def version=(value)
    @property_hash[:version] = value
    # Store updated properties for flush
    @property_flush[:version] = value
  end

  # this is a util method to build the JSON array to post the request to WAF
  def message(object, method)
    parameters = object.to_hash
    serverName = @resource[:name]

    val = parameters.key?(:identifier)

    if parameters.key?(:identifier) && parameters[:identifier] == :Hostname
      hostname = nil
      if parameters.key? :hostname
        hostname = parameters[:hostname]
      else
        raise(self.class.to_s.split('::').last + ': hostname is required parameter in the manifest if identifier is set to hostname.')
      end

      if hostname.nil?
        raise(self.class.to_s.split('::').last + ': hostname is empty. Please add a valid hostname since the identifier is set to hostname.')
      else
        parameters[:identifier] = 'Hostname'
        parameters[:hostname] = hostname
      end
    else
      ip_address = nil
      if parameters.key? :ip_address
        ip_address = parameters[:ip_address]

        if ip_address.nil?
          raise(self.class.to_s.split('::').last + ': ip_address is empty. Please a valid value for it.')
        else
          parameters[:identifier] = 'IP Address'
          parameters[:ip_address] = ip_address
        end
      else
        raise(self.class.to_s.split('::').last + ': ip_address is required parameter in the manifest.')
      end
    end

    parameters.delete(:provider)
    parameters.delete(:ensure)
    parameters.delete(:loglevel)
    parameters.delete(:service_name)

    if method == 'PUT'
      parameters.delete(:address_version)
      parameters.delete(:name)
    end

    parameters = convert_underscores(parameters)

    parameters = strip_nil_values(parameters) if method == 'PUT'

    parameters
  end

  # this method does a POST call to create a server in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug(self.class.to_s.split('::').last + ': Calling create method :')

    response, status_code, headers = Puppet::Provider::Cudawaf.post('Server', @resource[:service_name], message(resource, 'POST'), {})
    @property_hash.clear
    [response, status_code, headers]
  end

  # this method will call the delete api of a WAF service
  def destroy
    Puppet.debug(self.class.to_s.split('::').last + ': Calling destroy method: ')

    response, status_code, headers = Puppet::Provider::Cudawaf.delete('Server', @resource[:service_name], @resource[:name], {})
    @property_hash.clear
    [response, status_code, headers]
  end
end
