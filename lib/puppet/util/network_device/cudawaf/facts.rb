require 'puppet/util/network_device/cudawaf'
require_relative '../../../../puppet_x/modules/login_info'
require_relative '../../../../puppet_x/modules/system_api'
require 'uri'

class Puppet::Util::NetworkDevice::Cudawaf::Facts
  attr_reader :transport, :url

  def initialize(transport, url)
    Puppet.debug(self.class.to_s.split("::").last + ": Inside Initialize of Facts!")
    @transport = transport
    @url = url
  end

  def retrieve(url)
    Puppet.debug(self.class.to_s.split("::").last + ": Retrieving Facts from facts.rb!")

    facts = parse_device_facts()
  end

  def parse_device_facts
    facts = {
      :productType => :Cudawaf
    }

    Puppet.debug(self.class.to_s.split("::").last + ": Parsing facts for device - " + @url.host)
    device_url = @url.scheme + "://" + @url.user + ":" + @url.password + "@" + @url.host + ":" + @url.port.to_s + "/"

    #
    #  Invoke a System API call to retrieve the facts about each device.
    #
    response, status_code = @transport.get(device_url, "System", {})
    if status_code == 200 and items = response['data']['System']
      Puppet.debug(self.class.to_s.split("::").last + ": Response for System API - #{items}")
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

    Puppet.debug(self.class.to_s.split("::").last + ": Facts - #{facts}")
    return facts
  end

end
