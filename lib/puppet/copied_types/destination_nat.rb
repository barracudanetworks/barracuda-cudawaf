Puppet::Type.newtype(:destination_nat) do
  @doc = 'Defines all possible types for Destination NAT object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:incoming_interface) do
    desc "Incoming Interface"
  end


  newproperty(:post_destination_address) do
    desc "Post-DNAT Destination"
  end


  newproperty(:pre_destination_address, :array_matching => :all) do
    desc "Pre-DNAT Destination"
    validate do |value|
      fail("Invalid pre_destination_address #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:pre_destination_netmask) do
    desc "Pre-DNAT Destination Mask"
  end


  newproperty(:pre_destination_port) do
    desc "Destination Port"
    defaultto 1-65535
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid pre_destination_port #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid pre_destination_port #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:protocol) do
    desc "Protocol"
    newvalues(:TCP/UDP, :TCP, :UDP, :Any)
  end


  newproperty(:vsite) do
    desc "Network Group"
  end


end
