Puppet::Type.newtype(:system_proxy_server) do
  @doc = 'Defines all possible types for Proxy Server of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:password) do
    desc "Server Password"
  end


  newproperty(:port) do
    desc "Server Port"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid port #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid port #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:server) do
    desc "Server Name/IP"
    validate do |value|
      fail("Invalid server #{value}, Illegal characters present") unless value =~ /^[[:alnum:]][[:alnum:]._-]*$/
    end
  end


  newproperty(:username) do
    desc "Server Username"
    validate do |value|
      fail("Invalid username #{value}, Illegal characters present") unless value =~ /(^([a-zA-Z0-9.\-\_]))*$/
    end
  end


end
