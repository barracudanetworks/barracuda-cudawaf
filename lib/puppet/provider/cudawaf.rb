require 'puppet/util/network_device/cudawaf'
require 'puppet/util/network_device/transport/cudawaf'

$rest_client_objects = {
                        "Certificate" => 1,
                        "CloudControl" => 1
                       }
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

  #
  #  The API is invoked on the Cudawaf by two major means -
  #    1. Swagger SDK API client is used for 90% of the configuration objects (including services, servers etc).
  #    2. RestClient library is used for the remaining objects (including login, certificates and cloud control).
  #

  def self.get(url, instance, *args)
    $rest_client_objects.key?(instance) ? transport.client_get(url, instance, *args) : transport.get(url, instance, *args)
  end

  def self.post(url, instance, *args)
    $rest_client_objects.key?(instance) ? transport.client_post(url, instance, *args) : transport.post(url, instance, *args)
  end

  def self.put(url, instance, *args)
    $rest_client_objects.key?(instance) ? transport.client_put(url, instance, *args) : transport.put(url, instance, *args)
  end

  def self.delete(url, instance, *args)
    $rest_client_objects.key?(instance) ? transport.client_delete(url, instance, *args) : transport.delete(url, instance, *args)
  end

  #def self.facts
  #  @device ||= device
  #  @facts = @device.facts
  #end

end
