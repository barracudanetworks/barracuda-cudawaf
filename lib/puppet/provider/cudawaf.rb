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
      Puppet::Util::NetworkDevice.current.transport
    else
      Puppet::Util::NetworkDevice::Transport::Cudawaf.new(Facter.value(:url))
    end
  end

  def self.device_url
    Puppet::Util::NetworkDevice.current ? Puppet::Util::NetworkDevice.current.url.to_s : Facter.value(:url)
  end

  #
  #  The API is invoked on the Cudawaf by two major means -
  #    1. Swagger SDK API client is used for 90% of the configuration objects (including services, servers etc).
  #    2. RestClient library is used for the remaining objects (including login, certificates and cloud control).
  #

  #
  #  The following API methods are for accessing the WAF via the Swagger SDK.
  #
  def self.get(instance, *args)
    transport.get(device_url, instance, *args)
  end

  def self.post(instance, *args)
    transport.post(device_url, instance, *args)
  end

  def self.put(instance, *args)
    transport.put(device_url, instance, *args)
  end

  def self.delete(instance, *args)
    transport.delete(device_url, instance, *args)
  end

  #
  #  The following API methods are for accessing the WAF via the RestClient library.
  #
  def self.client_get(instance, *args)
    transport.client_get(device_url, instance, *args)
  end

  def self.client_post(instance, *args)
    #device_url = Puppet::Util::NetworkDevice.current ? Puppet::Util::NetworkDevice.current.url.to_s : Facter.value(:url)
    transport.client_post(device_url, instance, *args)
  end

  def self.client_put(instance, *args)
    transport.client_put(device_url, instance, *args)
  end

  def self.client_delete(instance, *args)
    transport.client_delete(device_url, instance, *args)
  end

  #def self.facts
  #  @device ||= device
  #  @facts = @device.facts
  #end

end
