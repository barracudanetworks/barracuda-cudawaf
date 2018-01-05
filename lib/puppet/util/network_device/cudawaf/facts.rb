require 'puppet/util/network_device/cudawaf'
require 'puppet_x/modules/login_info'

class Puppet::Util::NetworkDevice::Cudawaf::Facts
  attr_reader :transport, :url

  def initialize(transport, url)
    Puppet.debug("Inside Initialize of Facts!")
    @transport = transport
    @url = url
  end

  def retrieve(url)
    Puppet.debug("Retrieving Facts from facts.rb!")

    facts = parse_device_facts()
  end

  def parse_device_facts
    facts = {
      :firmwareversion => :Cudawaf
    }

    Puppet.debug("Parsing facts for device - " + @url.host)
    device_url = @url.scheme + "://" + @url.user + ":" + @url.password + "@" + @url.host + ":" + @url.port.to_s + "/"
    Puppet.debug("Device URL - " + device_url)

    #
    #  Need to do an API call to retrieve the facts about each device.
    #  TODO: Loop through all devices in the device.conf and get the facts for each.
    #
    if response = @transport.get(device_url, "System", "system_get", {}) and items = response['data']['System']
      Puppet.debug("Response for System API - #{items}")
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
      api_fact_name = fact.to_s.gsub(/_/, "-")
      facts[fact] = items[api_fact_name.to_s]
    end


    #
    #  Map the device name to the node name in device.conf to easily identify this WAF.
    facts[:node] = device_url

    Puppet.debug("Facts - #{facts}")
    return facts
  end

end
