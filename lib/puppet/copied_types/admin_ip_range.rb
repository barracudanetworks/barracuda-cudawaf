Puppet::Type.newtype(:admin_ip_range) do
  @doc = 'Defines all possible types for Admin IP Range object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:ip_address, :array_matching => :all) do
    desc "New IP Address"
    validate do |value|
      fail("Invalid ip_address #{value}, Illegal characters present") unless value =~ /\d+\.\d+\.\d+\.\d+/
    end
  end


  newproperty(:netmask) do
    desc "Subnet Mask"
    validate do |value|
      fail("Invalid netmask #{value}, Illegal characters present") unless value =~ /\d+\.\d+\.\d+\.\d+/
    end
  end


end
