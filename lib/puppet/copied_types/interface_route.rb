Puppet::Type.newtype(:interface_route) do
  @doc = 'Defines all possible types for Interface Route object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:interface) do
    desc "Network Interface"
  end


  newproperty(:ip_address, :array_matching => :all) do
    desc "IP/Network Address"
    validate do |value|
      fail("Invalid ip_address #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:ip_version) do
    desc "IP Version for the Interface"
    defaultto :IPv4
    newvalues(:IPv4, :IPv6)
  end


  newproperty(:netmask) do
    desc "Netmask"
  end


  newproperty(:vsite) do
    desc "Network Group"
  end


end
