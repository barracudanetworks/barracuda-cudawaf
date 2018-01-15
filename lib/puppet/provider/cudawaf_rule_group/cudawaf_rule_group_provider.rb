require 'puppet_x/modules/login_info'
require 'puppet_x/modules/utils'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_rule_group).provide(:cudawaf_rule_group_provider, parent: Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  def exists?
    @property_hash[:ensure] == :present
  end

  def self.instances
    Puppet.debug(self.to_s.split('::').last + ': Calling self.instances method')
    services = getservices
    instances = []

    services.each do |service|
      response, status_code, headers = Puppet::Provider::Cudawaf.get('ContentRule', service, {})
      Puppet.debug(self.to_s.split('::').last + ": WAF get all content rules response :    #{response}")

      next unless response.key?('data')

      svrData = response['data']
      serviceName = response['Service']

      next unless svrData
      svrData.each do |_key, val|
        instances <<  new(
          ensure: :present,
          name: val['name'],
          service_name: response['Service'],
          app_id: val['app-id'],
          comments: val['comments'],
          extended_match: val['extended-match'],
          extended_match_sequence: val['extended-match-sequence'],
          host_match: val['host-match'],
          mode: val['mode'],
          status: val['status'],
          url_match: val['url-match'],
          web_firewall_policy: val['web-firewall-policy']
        )
      end
    end # do end services

    instances
  end

  # this method get all services from WAF system and builds the instances array
  def self.getservices
    service_instances = []

    response, status_code, headers = Puppet::Provider::Cudawaf.get('Service', {})
    Puppet.debug(self.to_s.split('::').last + ": WAF Get all services response:    #{response}")

    unless response.nil?
      if status_code == 200
        svcData = response['data']
        if svcData.nil?
          svcData.each do |_key, value|
            service_instances.push(value['name'])
          end
        end   #if svcData check end
      end # if end
    end # unless end

    service_instances
  end

  # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug(self.to_s.split('::').last + ': Calling self.prefetch method : ')

    servers = instances
    resources.keys.each do |name|
      provider = servers.find do |server|
        resources[name][:name].to_s == server.name.to_s &&
          resources[name][:service_name].to_s == server.service_name.to_s
      end
      resources[name].provider = provider unless provider.nil?
    end
  end

  def flush
    Puppet.debug(self.class.to_s.split('::').last + ': Calling flush method : ')
    if @property_hash != {}
      response, status_code, headers = Puppet::Provider::Cudawaf.put('ContentRule', @resource[:service_name], @resource[:name], message(resource), {})

      if status_code == 200
        return response, status_code, headers
      else
        Puppet.debug(self.class.to_s.split('::').last + ": There is some problem to process the request. status_code is #{status_code}")
        return
      end
    end
  end

  # this is a util method to build the JSON array to post the request to WAF
  def message(object)
    parameters = object.to_hash

    parameters.delete(:provider)
    parameters.delete(:ensure)
    parameters.delete(:loglevel)
    parameters.delete(:service_name)
    parameters = convert_underscores(parameters)

    parameters
  end

  # this method does a POST call to create a rule group in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug(self.class.to_s.split('::').last + ': Calling create method :')

    response, status_code, headers = Puppet::Provider::Cudawaf.post('ContentRule', @resource[:service_name], message(resource), {})

    # We clear the hash here to stop flush from triggering.
    @property_hash.clear

    [response, status_code, headers]
  end

  # this method will call the delete API of a WAF rule group
  def destroy
    Puppet.debug(self.class.to_s.split('::').last + ': Calling destroy method : ')

    response, status_code, headers = Puppet::Provider::Cudawaf.delete('ContentRule', @resource[:service_name], @resource[:name], {})

    # We clear the hash here to stop flush from triggering.
    @property_hash.clear

    [response, status_code, headers]
  end
end
