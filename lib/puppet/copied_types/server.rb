Puppet::Type.newtype(:server) do
  @doc = 'Defines all possible types for Server object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Server Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 255 characters") if value.length > 255
    end
  end


  newproperty(:address_version) do
    desc "Version"
    defaultto :IPv4
    newvalues(:IPv4, :IPv6)
  end


  newproperty(:comments) do
    desc "Comments"
  end


  newproperty(:hostname) do
    desc "Hostname"
    validate do |value|
      fail("Invalid hostname #{value}, Illegal characters present") unless value =~ /(^([a-zA-Z0-9\.\-\_]+))$/
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


  newproperty(:status) do
    desc "Status"
    defaultto 'In Service'
    newvalues('In Service', 'Out of Service Maintenance', 'Out of Service Sticky', 'Out of Service All')
  end


end
