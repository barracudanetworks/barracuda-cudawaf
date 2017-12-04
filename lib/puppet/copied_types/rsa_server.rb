Puppet::Type.newtype(:rsa_server) do
  @doc = 'Defines all possible types for RSA Server object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:ip_address, :array_matching => :all) do
    desc "Server IP"
    validate do |value|
      fail("Invalid ip_address #{value}, Illegal characters present") unless value =~ /(^([a-zA-Z0-9.\-\_]+))$/
    end
  end


  newproperty(:port) do
    desc "Server Port"
    defaultto 1812
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid port #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid port #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:retries) do
    desc "Retries"
    defaultto 3
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid retries #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid retries #{value}, Must not be greater than 10") if value > 10
    end
  end


  newproperty(:shared_secret) do
    desc "Shared Secret"
  end


  newproperty(:timeout) do
    desc "Timeout"
    defaultto 3
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid timeout #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid timeout #{value}, Must not be greater than 30") if value > 30
    end
  end


end
