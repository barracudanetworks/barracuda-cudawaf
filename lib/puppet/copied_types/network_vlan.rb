Puppet::Type.newtype(:network_vlan) do
  @doc = 'Defines all possible types for Network VLAN object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "VLAN Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^.*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:interface) do
    desc "VLAN Interface"
  end


  newproperty(:vlan_id) do
    desc "VLAN ID"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid vlan_id #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid vlan_id #{value}, Must not be greater than 4095") if value > 4095
    end
  end


  newproperty(:vsite) do
    desc "Network Group"
  end


end
