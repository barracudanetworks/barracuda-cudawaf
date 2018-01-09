require 'puppet_x/modules/login_info'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'
require 'rest-client'

Puppet::Type.type(:cudawaf_server).provide(:cudawaf_server_provider, :parent => Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  def initialize(value={})
    super(value)
    @property_flush = {}
  end
 
  # this method will get server/servername and return true or false
  def exists?
    Puppet.debug("Calling exists method of serverprovider: #{@resource[:name]}")
    @property_hash[:ensure] == :present
  end

  #this method get all servers from WAF system and builds the instances array
  def self.instances()
    device_url = Puppet::Util::NetworkDevice.current.url.to_s
    services = getservices(device_url)

    Puppet.debug("List of services .................. #{services}")
    instances=[]

    services.each do |service|
      serviceName = service
      Puppet.debug("Service Name : #{serviceName}")

      # get all servers from WAF
      response, status_code, headers = Puppet::Provider::Cudawaf.get(device_url, "Server", serviceName, {})
      Puppet.debug("WAF Get all servers response:    #{response}")
  
      svrData =response["data"]
      serviceName = response["Service"]
      if svrData
        svrData.each do |key,val|
          servname = val["name"]
          instances <<  new(
            :ensure => :present,
            :name => val["name"],
            :service_name => response["Service"],
            :address_version => val["address-version"],
            :status => val["status"],
            :hostname => val["hostname"],
            :comments => val["comments"],
            :port => val["port"],
            :identifier => val["identifier"],
            :ip_address => val["ip-address"]
          )
        end
      end
    end # do end services

    return instances
  end


  #this method get all services from WAF system and builds the instances array
  def self.getservices(url)
    Puppet.debug("Calling getservices  method of serverprovider: ")
    service_instances = []

    # get all services from WAF
    data, status_code, headers = Puppet::Provider::Cudawaf.get(url, "Service", {})
    Puppet.debug("WAF Get all services response:    #{data}")

    unless data == '{}'
      if status_code == 200
        response = data
        svcobj = response["object"]
        Puppet.debug("Object is  #{svcobj}")
        svcData = response["data"]
        Puppet.debug("Service data - having servers:  #{svcData}")
        svcData.each do |key,value|
          service_instances.push(value["name"])
        end
      end # if end
    end  # unless end
 
    return service_instances
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
    Puppet.debug("Calling  flush method of serverprovider: ")
    if @property_hash != {}
      device_url = Puppet::Util::NetworkDevice.current.url.to_s
      response, status_code, headers = Puppet::Provider::Cudawaf.put(device_url, "Server", @resource[:service_name], @resource[:name], message(resource), {})

      if status_code == 200
        return response, status_code, headers
      else
        Puppet.debug("There is some problem to process the request. status_code is #{status_code}")
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
  def message(object)
    Puppet.debug("Object.......... #{object}")
    parameters = object.to_hash
    Puppet.debug("Parameters.......... #{parameters}")
    serverName=@resource[:name]

    val = parameters.has_key?(:identifier)
    val2 = parameters[:identifier]

    if parameters.has_key?(:identifier) && parameters[:identifier] == :Hostname
      hostname = nil
      if parameters.key?:hostname
        hostname = parameters[:hostname]
       else
         fail("hostname is required parameter in the manifest if identifier is set to hostname.")
       end

       if hostname.nil?
         fail("hostname is empty. Please add a valid hostname since the identifier is set to hostname.")
       else
         parameters[:identifier]="Hostname"
         parameters[:hostname]=hostname
       end
    else
      ip_address = nil
      if parameters.key?:ip_address
        ip_address = parameters[:ip_address]

        if ip_address.nil?
          fail("ip_address is empty. Please a valid value for it.")
        else
           parameters[:identifier]="IP Address"
           parameters[:ip_address]=ip_address
        end
      else
        fail("ip_address is required parameter in the manifest.")
      end
    end

    parameters.delete(:provider)
    parameters.delete(:ensure)
    parameters.delete(:loglevel)
    parameters.delete(:service_name)
    parameters.delete(:address_version)
    parameters.delete(:name)
    parameters=convert_underscores(parameters)
    parameters = strip_nil_values(parameters)
    return parameters
  end

  def postmessage(object)
    Puppet.debug("Object.......... #{object}")
    parameters = object.to_hash
    Puppet.debug("Parameters.......... #{parameters}")
    serverName=@resource[:name]

    val = parameters.has_key?(:identifier)
    val2 = parameters[:identifier]

    if parameters.has_key?(:identifier) && parameters[:identifier] == :Hostname
      hostname = nil
      if parameters.key?:hostname
        hostname = parameters[:hostname]
      else
        fail("hostname is required parameter in the manifest if identifier is set to hostname.")
      end

      if hostname.nil?
        fail("hostname is empty. Please add a valid hostname since the identifier is set to hostname.")
      else
        parameters[:identifier]="Hostname"
        parameters[:hostname]=hostname
      end
    else
      ip_address = nil
      if parameters.key?:ip_address
        ip_address = parameters[:ip_address]

        if ip_address.nil?
          fail("ip_address is empty. Please a valid value for it.")
        else
          parameters[:identifier]="IP Address"
          parameters[:ip_address]=ip_address
        end
      else
         fail("ip_address is required parameter in the manifest.")
      end
    end

    parameters.delete(:provider)
    parameters.delete(:ensure)
    parameters.delete(:loglevel)
    parameters.delete(:service_name)
    parameters=convert_underscores(parameters)
    Puppet.debug("Parameters.......... second time....................... #{parameters}")
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

  def strip_nil_values(hash)
    hash.reject { |k, v| v.nil? }
  end

  # this method does a POST call to create a server in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug("Calling create method of serverprovider:")
    serviceName=@resource[:service_name]

    device_url = Puppet::Util::NetworkDevice.current.url.to_s
    response, status_code, headers = Puppet::Provider::Cudawaf.post(device_url, "Server", @resource[:service_name], postmessage(resource), {})

    @property_hash.clear
    return response, status_code, headers
  end

  # this method will call the delete api of a WAF service
  def destroy
    Puppet.debug("Calling serverprovider destroy method: ")

    device_url = Puppet::Util::NetworkDevice.current.url.to_s
    response, status_code, headers = Puppet::Provider::Cudawaf.delete(device_url, "Server", @resource[:service_name], @resource[:name], {})

    @property_hash.clear
    return response, status_code, headers
  end

end
