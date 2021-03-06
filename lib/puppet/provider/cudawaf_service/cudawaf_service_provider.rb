require_relative '../../../puppet_x/modules/login_info'
require_relative '../../../puppet_x/modules/utils'
require File.join(File.dirname(__FILE__), '../cudawaf')

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_service).provide(:cudawaf_service_provider, parent: Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  # this method will get service/servicename and return true or false
  def exists?
    Puppet.debug(self.class.to_s.split('::').last + ': Calling exists method : ')
    @property_hash[:ensure] == :present
  end

  # this method get all services from WAF system and builds the instances array
  def self.instances
    Puppet.debug(to_s.split('::').last + ': Calling self.instances method : ')
    instances = []

    response, status_code, headers = Puppet::Provider::Cudawaf.get('Service', {})
    Puppet.debug(to_s.split('::').last + ": WAF Get all services response: #{response}")

    unless response.nil?
      if status_code == 200
        svcData = response['data']
        unless svcData.nil?
          svcData.each do |_key, val|
            instances <<  new(
              ensure: :present,
              name: val['name'],
              address_version: val['address-version'],
              status: val['status'],
              certificate: val['certificate'],
              comments: val['comments'],
              port: val['port'],
              enable_access_logs: val['enable-access-logs'],
              session_timeout: val['session-timeout'],
              app_id: val['app-id'],
              group: val ['group'],
              type: val['type'],
              ip_address: val['ip-address'],
              vsite: val['vsite'],
              mask: val['mask']
            )
          end
       end # unless end
      end
   end

    instances
  end

  # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug(to_s.split('::').last + ': Calling self.prefetch method :')
    services = instances
    resources.keys.each do |name|
      if provider = services.find { |service| service.name == name }
        resources[name].provider = provider
      end
    end
  end

  # this method does a put call to waf service. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug(self.class.to_s.split('::').last + ': Calling flush method : ')

    if @property_hash != {}
      response, status_code, headers = Puppet::Provider::Cudawaf.put('Service', @resource[:name], message(resource, 'PUT'), {})
    end

    [response, status_code, headers]
  end

  # this method does a POST call to create a service in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug(self.class.to_s.split('::').last + ': Calling create method :')

    response, status_code, headers = Puppet::Provider::Cudawaf.post('Service', message(resource, 'POST'), {})
    [response, status_code, headers]
  end

  # this method will call the delete api of a WAF service
  def destroy
    Puppet.debug(self.class.to_s.split('::').last + ': Calling destroy method : ')
    response, status_code, headers = Puppet::Provider::Cudawaf.delete('Service', @resource[:name], {})

    # We clear the hash here to stop flush from triggering.
    @property_hash.clear

    [response, status_code, headers]
  end

  #
  # Util function to build the JSON array to post the request to WAF.
  #
  def message(object, method)
    opts = object.to_hash
    opts.delete(:provider)
    opts.delete(:ensure)
    opts.delete(:loglevel)

    opts.delete(:certificate) if method == 'PUT'

    #
    #  Munge customer's manifest values into acceptable API format.
    #
    opts = convert_underscores(opts)
    opts
  end
end
