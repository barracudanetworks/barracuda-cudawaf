require 'puppet/util/network_device/cudawaf'
require 'puppet/util/network_device/transport/cudawaf'

#
#  Initialize the Cudawaf device.
#
class Puppet::Provider::Cudawaf < Puppet::Provider
  def self.device(url)
    Puppet::Util::NetworkDevice::Cudawaf::Device.new(url)
  end

  def self.transport
    if Puppet::Util::NetworkDevice.current
      #we are in `puppet device`
      Puppet::Util::NetworkDevice.current.transport
    else
      #                #we are in `puppet resource`
      Puppet::Util::NetworkDevice::Transport::Cudawaf.new(Facter.value(:url))
    end
  end

  #def self.transport
  #  if Facter.value(:url) then
  #    Puppet.debug "Puppet::Util::NetworkDevice::Cudawaf: connecting via facter url."
  #    @device ||= Puppet::Util::NetworkDevice::Cudawaf::Device.new(Facter.value(:url))
  #  else
  #    @device ||= Puppet::Util::NetworkDevice.current
  #    raise Puppet::Error, "Puppet::Util::NetworkDevice::Cudawaf device not initialized #{caller.join("\n")}" unless @device
  #  end
  #end

  def self.call(url, instance, args={})
    transport.call(url, instance, args)
  end

  def self.get(url, instance, args={})
    transport.get(url, instance, args)
  end

  def self.post(url, instance, *args)
    transport.post(url, instance, *args)
  end

  def self.put(url, instance, *args)
    transport.put(url, instance, *args)
  end

  def self.delete(url, instance, *args)
    transport.delete(url, instance, *args)
  end

  #def self.facts
  #  @device ||= device
  #  @facts = @device.facts
  #end

  #def facts
    # this calls the class instance of self.transport instead of the object instance which causes an infinite loop.
  #  self.class.facts
  #end

  #def transport
    # this calls the class instance of self.transport instead of the object instance which causes an infinite loop.
  #  self.class.transport
  #end

end
