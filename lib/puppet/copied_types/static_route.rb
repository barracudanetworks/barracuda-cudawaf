Puppet::Type.newtype(:static_route) do
  @doc = 'Defines all possible types for Static Route object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:gateway) do
    desc "Gateway Address"
  end


  newproperty(:ip_address, :array_matching => :all) do
    desc "IP/Network Address"
    validate do |value|
      fail("Invalid ip_address #{value}, Illegal characters present") unless value =~ /\d+\.\d+\.\d+\.\d+/
    end
  end


  newproperty(:ip_version) do
    desc "IP Version for the Interface"
    defaultto :IPv4
    newvalues(:IPv4, :IPv6)
  end


  newproperty(:netmask) do
    desc "Netmask"
    validate do |value|
      fail("Invalid netmask #{value}, Illegal characters present") unless value =~ /^(\d{1,3})((\.\d{1,3}){3})?$/
    end
  end


  newproperty(:vsite) do
    desc "Network Group"
  end


end
