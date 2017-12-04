Puppet::Type.newtype(:server_connection_pooling) do
  @doc = 'Defines all possible types for Connection Pooling of Server object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Server Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 255 characters") if value.length > 255
    end
  end


  newproperty(:enable_connection_pooling) do
    desc "Enable Connection Pooling"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:keepalive_timeout) do
    desc "Keepalive Timeout"
    defaultto 900000
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid keepalive_timeout #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid keepalive_timeout #{value}, Must not be greater than 86400000") if value > 86400000
    end
  end


end
