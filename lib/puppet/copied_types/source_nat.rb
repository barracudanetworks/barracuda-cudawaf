Puppet::Type.newtype(:source_nat) do
  @doc = 'Defines all possible types for Source NAT object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:outgoing_interface) do
    desc "Outgoing Interface"
  end


  newproperty(:post_source_address) do
    desc "Post SNAT Source"
  end


  newproperty(:pre_source_address, :array_matching => :all) do
    desc "Pre SNAT Source"
    validate do |value|
      fail("Invalid pre_source_address #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:pre_source_netmask) do
    desc "Pre SNAT Source Mask"
  end


  newproperty(:pre_source_port) do
    desc "Destination Port"
    defaultto 1-65535
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid pre_source_port #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid pre_source_port #{value}, Must not be greater than 65535") if value > 65535
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
