Puppet::Type.newtype(:external_radius_service) do
  @doc = 'Defines all possible types for External RADIUS Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Realm Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


  newproperty(:default_role) do
    desc "Default Role"
  end


  newproperty(:port) do
    desc "Server Port"
    defaultto 1812
    munge do |value|
      Integer(value)
    end
  end


  newproperty(:server_ip) do
    desc "Server IP"
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
