require 'puppet/util/network_device/cudawaf'
require '../../../lib/puppet_x/login_info.rb'

class Puppet::Util::NetworkDevice::Cudawaf::Facts
  attr_reader :transport, :url

  def initialize(transport, url)
    @transport = transport
    @url = url
    Puppet.debug("Inside Initialize of Facts!")
    facts.merge(parse_device_facts)
  end

  def retrieve
    Puppet.debug("Retrieving Facts from fact.rb!")

    @facts = {}
    @facts["url"] = @url

    @facts
  end

  def parse_device_facts
    facts = {
      :firmwareversion => :Cudawaf
    }

    #
    #  Need to do an API call to retrieve the facts about each device.
    #  TODO: Loop through all devices in the device.conf and get the facts for each.
    #
    login_instance = Login.new
    auth_header = login_instance.get_auth_header(device)
    Puppet.debug("WAF authorization token:  #{auth_header}")

    if response = @transport.get(device, "System", "system_get", {}) and items = response['data']
      Puppet.debug("Response for System API: #{response}")
    else
      Puppet.warning("WARNING: Could not receive device details.")
      return facts
    end

    #
    # These are the facts that are going to be used to identify a particular WAF.
    #         System: {
    #            device-name: Web Application Firewall,
    #            domain: Barracudanetworks.com,
    #            hostname: barracuda,
    #            model: V660,
    #            serial: 557225,
    #            time-zone: America/Los_Angeles
    #        }
    #

    [ :device_name,
      :hostname,
      :model,
      :serial,
      :domain,
      :time_zone
    ].each do |fact|
      facts[fact] = result[fact.to_s]
    end

    # Map hostname.
    facts[:fqdn] = facts[:hostname]

    Puppet.debug("Facts - #{facts}")
    return facts
  end

end
