require_relative '../../../puppet_x/modules/login_info'
require_relative '../../../puppet_x/modules/utils'
require File.join(File.dirname(__FILE__), '../cudawaf')

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_rule_group_server).provide(:cudawaf_rule_group_server_provider, parent: Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  def exists?
    Puppet.debug(self.class.to_s.split('::').last + ': Calling exists method : ')
    @property_hash[:ensure] == :present
  end

  def self.instances
    Puppet.debug(to_s.split('::').last + ': Calling self.instances method')

    services = getservices
    instances = []

    services.each do |service|
      rules = getrules(service)
      rules.each do |rule|
        response, status_code, headers = Puppet::Provider::Cudawaf.get('ContentRuleServer', service, rule, {})
        Puppet.debug(to_s.split('::').last + ": WAF Get all rule_group_server response:  #{response}")

        svrData = response['data']
        service_name = response['Service']
        rule_group_name = response['Rule Group']

        next unless svrData
        svrData.each do |_key, val|
          instances << new(
            ensure: :present,
            name: val['name'],
            rule_group_name: rule_group_name,
            service_name: response['Service'],
            address_version: val['address-version'],
            backup_server: val['backup-server'],
            comments: val['comments'],
            hostname: val['hostname'],
            identifier: val['identifier'],
            ip_address: val['ip-address'],
            port: val['port'],
            status: val['status'],
            weight: val['weight']
          )
        end
        # if end
      end # if end for rules
    end # do end services

    instances
  end

  # this method get all services from WAF system and builds the instances array
  def self.getservices
    Puppet.debug(to_s.split('::').last + ': Calling getservices method : ')
    service_instances = []

    response, status_code, headers = Puppet::Provider::Cudawaf.get('Service', {})
    Puppet.debug(to_s.split('::').last + ": WAF Get all services response:    #{response}")

    unless response.nil?
      if status_code == 200
        svcData = response['data']
        unless svcData.nil?
          svcData.each do |_key, value|
            service_instances.push(value['name'])
          end
        end # unless svcData check end
      end
    end

    service_instances
  end

  # this method get all rules from WAF system and builds the instances array
  def self.getrules(service_name)
    Puppet.debug(to_s.split('::').last + ': Calling getrules method : ')
    rule_group_instances = []

    response, status_code, headers = Puppet::Provider::Cudawaf.get('ContentRule', service_name, {})
    Puppet.debug(to_s.split('::').last + ": WAF Get all rules response:    #{response}")

    unless response.nil?
      if status_code == 200
        svcData = response['data']

        unless svcData.nil?
          svcData.each do |_key, value|
            rule_group_instances.push(value['name'])
          end
        end
       end
    end

    rule_group_instances
  end

  def self.prefetch(resources)
    rules = instances
    resources.keys.each do |name|
      provider = rules.find do |rule|
        resources[name][:name].to_s == rule.name.to_s &&
          resources[name][:service_name].to_s == rule.service_name.to_s &&
          resources[name][:rule_group_name].to_s == rule.rule_group_name.to_s
      end

      resources[name].provider = provider unless provider.nil?
    end
  end # self.prefetch

  def flush
    Puppet.debug(self.class.to_s.split('::').last + ': Calling flush method : ')

    if @property_hash != {}
      response, status_code, headers = Puppet::Provider::Cudawaf.put('ContentRuleServer', @resource[:service_name], @resource[:rule_group_name], @resource[:name], message(resource, 'PUT'), {})

      if status_code == 200
        return response, status_code, headers
      else
        Puppet.debug(self.class.to_s.split('::').last + ": There is some problem to process the request. status_code is #{status_code}")
      end
    end
  end

  def message(object, method)
    parameters = object.to_hash

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
    parameters.delete(:rule_group_name)

    parameters.delete(:address_version) if method === 'PUT'

    parameters = convert_underscores(parameters)
    parameters
  end

  def create
    Puppet.debug(self.class.to_s.split('::').last + ': Calling create method : ')

    response, status_code, headers = Puppet::Provider::Cudawaf.post('ContentRuleServer', @resource[:service_name], @resource[:rule_group_name], message(resource, 'POST'), {})
    if status_code == 201
      @property_hash.clear
      return response, status_code, headers
    else
      raise(self.class.to_s.split('::').last + ': Not able to create the rule_group_server. Please check the rule_group_server api parameters')
    end
  end

  def destroy
    Puppet.debug(self.class.to_s.split('::').last + ': Calling destroy method : ')

    response, status_code, headers = Puppet::Provider::Cudawaf.delete('ContentRuleServer', @resource[:service_name], @resource[:rule_group_name], @resource[:name], {})
    @property_hash.clear
    [response, status_code, headers]
  end
end
