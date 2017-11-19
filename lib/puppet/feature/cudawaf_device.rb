require 'puppet/util/feature'
require File.join(File.dirname(__FILE__), '../util/network_device/transport/cudawaf')
require File.join(File.dirname(__FILE__), '../util/network_device/cudawaf/facts')

Puppet.features.add(:cudawaf_device) do
  begin
    transport = nil
    if Puppet::Util::NetworkDevice.current
      #we are in `puppet device`
      transport = Puppet::Util::NetworkDevice.current.transport
    else
      #we are in `puppet resource`
      transport = Puppet::Util::NetworkDevice::Transport::Cudawaf.new(Facter.value(:url))
    end
    facts     = Puppet::Util::NetworkDevice::Cudawaf::Facts.new(transport).retrieve
    if facts and facts[:operatingsystem] == :Cudawaf
      true
    else
      false
    end
  rescue
    false
  end
end
