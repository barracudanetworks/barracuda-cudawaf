require 'puppet/util/network_device/base'
require File.join(File.dirname(__FILE__), '../cudawaf')
require File.join(File.dirname(__FILE__), '../cudawaf/facts')
require File.join(File.dirname(__FILE__), '../transport/cudawaf')

class Puppet::Util::NetworkDevice::Cudawaf::Device
  attr_reader :connection
  attr_accessor :url, :transport

  def initialize(url, options = {})
    @autoloader = Puppet::Util::Autoload.new(
      self,
      "puppet/util/network_device/transport"
    )
    if @autoloader.load("cudawaf")
      @transport = Puppet::Util::NetworkDevice::Transport::Cudawaf.new(url,options[:debug])
      Puppet.debug("Inside Device Initialize URL :" + url)
    end
  end

  def facts
    Puppet.debug("Inside Device FACTS Initialize URL :" + @url)
    @facts ||= Puppet::Util::NetworkDevice::Cudawaf::Facts.new(@transport)

    return @facts.retrieve
  end

end
