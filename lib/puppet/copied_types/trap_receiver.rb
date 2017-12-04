Puppet::Type.newtype(:trap_receiver) do
  @doc = 'Defines all possible types for Trap Receiver object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:community_string) do
    desc "Community String"
  end


  newproperty(:ip_address, :array_matching => :all) do
    desc "Trap Receiver IP Address"
    validate do |value|
      fail("Invalid ip_address #{value}, Illegal characters present") unless value =~ /^\d+\.\d+\.\d+\.\d+$/
    end
  end


  newproperty(:port) do
    desc "Port"
  end


end
