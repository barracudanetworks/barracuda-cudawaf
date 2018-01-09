Puppet::Type.newtype(:cudawaf_server) do
  @doc = 'Defines all possible types for a Server object on the Barracuda Web Application Firewall.'

  apply_to_device
  ensurable

  newparam(:name, :namevar => true) do
    desc "Server Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 255 characters") if value.length > 255
    end
  end

  newparam(:service_name, :namevar => true) do
    desc 'Service Name'
    validate do |value|
      fail("Invalid service_name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:address_version) do
    desc "Version"
    defaultto :IPv4
    newvalues(:IPv4, :IPv6)
  end


  newproperty(:status) do
    desc "Status"
    defaultto 'In Service'
    newvalues('In Service', 'Out of Service Maintenance', 'Out of Service Sticky', 'Out of Service All')
  end


  newproperty(:hostname) do
    desc "Hostname"
    validate do |value|
      fail("Invalid hostname #{value}, Illegal characters present") unless value =~ /(^([a-zA-Z0-9\.\-\_]+))$/
    end
  end


  newproperty(:comments) do
    desc "Comments"
  end


  newproperty(:port) do
    desc "Server Port"
    defaultto 80
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid port #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid port #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:identifier) do
    desc "Identifier"
    defaultto 'IP Address'
    newvalues('IP Address', 'Hostname')
  end


  newproperty(:ip_address) do
    desc "Server IP"
  end


  def self.title_patterns
     [ [ /(.*)/m, [ [:name] ] ] ]
  end

end

