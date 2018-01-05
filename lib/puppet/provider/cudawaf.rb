require_relative '../../puppet/util/network_device/cudawaf'
require_relative '../../puppet/util/network_device/transport/cudawaf'

#
#  Initialize the Cudawaf device.
#
class Puppet::Provider::Cudawaf < Puppet::Provider
  attr_accessor :device

  def self.transport
    if Facter.value(:url) then
      Puppet.debug "Puppet::Util::NetworkDevice::Cudawaf: connecting via facter url."
      @device ||= Puppet::Util::NetworkDevice::Cudawaf::Device.new(Facter.value(:url))
    else
      @device ||= Puppet::Util::NetworkDevice.current
      raise Puppet::Error, "Puppet::Util::NetworkDevice::Cudawaf device not initialized #{caller.join("\n")}" unless @device
    end
  end

  def self.facts
    @device ||= device
    @facts = @device.facts
  end

  def facts
    # this calls the class instance of self.transport instead of the object instance which causes an infinite loop.
    self.class.facts
  end

  def transport
    # this calls the class instance of self.transport instead of the object instance which causes an infinite loop.
    self.class.transport
  end

end
