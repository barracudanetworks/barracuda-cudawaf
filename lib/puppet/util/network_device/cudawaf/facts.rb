require 'puppet/util/network_device/cudawaf'

class Puppet::Util::NetworkDevice::Cudawaf::Facts

  attr_reader :transport, :url
  def initialize(trasport, url)
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

      if response = @transport.call('/mgmt/tm/cm/device') and items = response['items']
        result = items.first
      else
        Puppet.warning("Did not receive device details.")
        return facts
      end

      [ :hostname,
        :managementIp,
        :timeZone,
        :version
      ].each do |fact|
        facts[fact] = result[fact.to_s]
      end

      # Map hostname.
      facts[:fqdn]            = facts[:hostname]

      return facts
    end
end
