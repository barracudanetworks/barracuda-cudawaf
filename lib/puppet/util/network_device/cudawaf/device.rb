require 'puppet/util/network_device/base'
require 'puppet/util/network_device/cudawaf'
require 'puppet/util/network_device/cudawaf/facts'
require 'puppet/util/network_device/transport/cudawaf'

require "uri"

class Puppet::Util::NetworkDevice::Cudawaf::Device
  attr_accessor :url, :transport

  def initialize(url, options = {})
    @url = URI.parse(url)
    Puppet.debug("URL - " + url)

    @autoloader = Puppet::Util::Autoload.new(
      self,
      "puppet/util/network_device/transport"
    )
    if @autoloader.load("cudawaf")
      @transport = Puppet::Util::NetworkDevice::Transport::Cudawaf.new(@url, options[:debug])
      Puppet.debug("Inside Device Initialize")
    end
  end

  def facts
    Puppet.debug("Inside Device FACTS Initialize")
    Puppet.debug("URL:" + @url.host)
    @facts ||= Puppet::Util::NetworkDevice::Cudawaf::Facts.new(@transport, @url)

    return @facts.retrieve(@url)
  end

end
