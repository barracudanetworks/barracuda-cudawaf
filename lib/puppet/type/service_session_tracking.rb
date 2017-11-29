Puppet::Type.newtype(:service_session_tracking) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:identifiers) do
    desc "Session Identifiers"
  end


  newproperty(:exception_clients) do
    desc "Exception Clients"
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:max_interval) do
    desc "Counting Criterion"
    defaultto 60
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_interval #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_interval #{value}, Must not be greater than 3600") if value > 3600
    end
  end


  newproperty(:max_sessions_per_ip) do
    desc "New Session Count"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_sessions_per_ip #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_sessions_per_ip #{value}, Must not be greater than 65535") if value > 65535
    end
  end


end
