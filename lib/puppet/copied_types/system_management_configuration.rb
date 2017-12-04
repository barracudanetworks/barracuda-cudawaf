Puppet::Type.newtype(:system_management_configuration) do
  @doc = 'Defines all possible types for Management Configuration of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:allow_administration_access) do
    desc "Allow Administration Access"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:gateway) do
    desc "IPv4 Default Gateway"
  end


  newproperty(:ip_address) do
    desc "IPv4 Address"
  end


  newproperty(:ipv6_address) do
    desc "IPv6 Address"
  end


  newproperty(:ipv6_gateway) do
    desc "IPv6 Default Gateway"
  end


  newproperty(:ipv6_mask) do
    desc "IPv6 Default Gateway"
  end


  newproperty(:mask) do
    desc "IPv4 Subnet Mask"
  end


  newproperty(:vlan_id) do
    desc "Management VLAN ID(Optional):"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid vlan_id #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid vlan_id #{value}, Must not be greater than 4095") if value > 4095
    end
  end


end
