Puppet::Type.newtype(:preferred_client) do
  @doc = 'Defines all possible types for Preferred Client object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Preferred Clients Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:ip_range) do
    desc "Client IP Range"
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:weight) do
    desc "Weight"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid weight #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid weight #{value}, Must not be greater than 100") if value > 100
    end
  end


end
