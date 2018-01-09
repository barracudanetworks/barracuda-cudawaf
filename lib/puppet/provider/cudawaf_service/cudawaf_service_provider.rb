require 'puppet_x/modules/login_info'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_service).provide(:cudawaf_service_provider, :parent => Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  # this method will get service/servicename and return true or false 
  def exists?
    Puppet.debug("Calling exists method of cudawaf_service_provider : ")
    @property_hash[:ensure] == :present
  end

  #this method get all services from WAF system and builds the instances array
  def self.instances
    Puppet.debug("Calling self.instances method of cudawaf_service_provider: ")
    instances = []

    device_url = Puppet::Util::NetworkDevice.current.url.to_s

    data, status_code, headers = Puppet::Provider::Cudawaf.get(device_url, "Service", {})
    Puppet.debug("WAF Get all services response: #{data}")

    unless data == '{}'
      if status_code == 200
        response = data

        svcobj = response["object"]
        svcData = response["data"]
        
        svcData.each do |key,value|
          val = value
          instances <<  new(
                             :ensure => :present,
                             :name => val["name"],
                             :address_version=>val["address-version"],
                             :status => val["status"],
                             :certificate=>val["certificate"],
                             :comments => val["comments"],
                             :port => val["port"],
                             :enable_access_logs =>val["enable-access-logs"],
                             :session_timeout => val["session-timeout"],
                             :app_id => val["app-id"],
                             :group => val ["group"],
                             :type => val["type"],
                             :ip_address => val["ip-address"],
                             :vsite => val["vsite"],
                             :mask => val["mask"]
                           ) 
        end
      end
    end

    return instances
  end

  # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug("Calling self.prefetch method of cudawaf_service_provider:")
    services = instances

    resources.keys.each do |name|
      if provider = services.find {|service| service.name == name}
        resources[name].provider = provider
      end    
    end
  end

  # this method does a put call to waf service. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug("Calling flush method of cudawaf_service_provider: ")

    if @property_hash != {}
      device_url = Puppet::Util::NetworkDevice.current.url.to_s
      response, status_code, headers = Puppet::Provider::Cudawaf.put(device_url, "Service", @resource[:name], message(resource, "PUT"), {})
    end

    return response, status_code, headers
  end

  # this method does a POST call to create a service in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug("Calling create method of cudawaf_service_provider:")

    device_url = Puppet::Util::NetworkDevice.current.url.to_s
    response, status_code, headers = Puppet::Provider::Cudawaf.post(device_url, "Service", message(resource, "POST"), {})

    return response, status_code, headers
  end

  # this method will call the delete api of a WAF service 
  def destroy
    Puppet.debug("Calling cudawaf_service_provider destroy method: ")

    device_url = Puppet::Util::NetworkDevice.current.url.to_s
    response, status_code, headers = Puppet::Provider::Cudawaf.delete(device_url, "Service", @resource[:name], {})

    # We clear the hash here to stop flush from triggering.
    @property_hash.clear

    return response, status_code, headers
  end

  #
  # Util function to build the JSON array to post the request to WAF.
  #
  def message(object, method)
    opts = object.to_hash
    opts.delete(:provider)
    opts.delete(:ensure)
    opts.delete(:loglevel)

    if method == "PUT"
      opts.delete(:certificate)
    end

    #
    #  Munge customer's manifest values into acceptable API format.
    # 
    opts = convert_underscores(opts)
    params = opts

    #Puppet.debug("PARAM....................#{params}")
    return params
  end

  #
  #  Puppet doesn't accept hyphenated strings for parameters, so we need to convert them to underscores.
  #
  def convert_underscores(hash)
    hash.each_with_object({}) do |(k ,v), obj|
      key = k.to_s.gsub(/_/, '-').to_sym
      obj[key] = v
    end
  end

  #
  #  Puppet doesn't accept hyphenated strings for parameters, so we need to convert them to underscores.
  #
  #def convert_lowercase(hash)
  #  hash.each_with_object({}) do |(k ,v), obj|
  #    Puppet.debug("Converting value " + v.to_s + " to downcase")
  #    obj[key] = v.to_s.downcase
  #  end
  #end

end
