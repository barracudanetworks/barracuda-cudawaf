Puppet::Type.newtype(:allow_or_deny_client) do
  @doc = 'Defines all possible types for Allow or Deny Client object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Rule Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:action) do
    desc "Action"
    defaultto :Deny
    newvalues(:Allow, :Deny)
  end


  newproperty(:common_name) do
    desc "Common Name"
    defaultto :*
    validate do |value|
      fail("Invalid common_name #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\s@\/\*-]*$/
    end
  end


  newproperty(:country) do
    desc "Country"
    defaultto :*
    validate do |value|
      fail("Invalid country #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\s@\/\*-]*$/
    end
  end


  newproperty(:locality) do
    desc "Locality"
    defaultto :*
    validate do |value|
      fail("Invalid locality #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\s@\/\*-]*$/
    end
  end


  newproperty(:organization) do
    desc "Organization"
    defaultto :*
    validate do |value|
      fail("Invalid organization #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\s@\/\*-]*$/
    end
  end


  newproperty(:organizational_unit) do
    desc "Organizational Unit"
    defaultto :*
    validate do |value|
      fail("Invalid organizational_unit #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\s@\/\*-]*$/
    end
  end


  newproperty(:sequence) do
    desc "Sequence"
    defaultto 1
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid sequence #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid sequence #{value}, Must not be greater than 10000") if value > 10000
    end
  end


  newproperty(:state) do
    desc "State"
    defaultto :*
    validate do |value|
      fail("Invalid state #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\s@\/\*-]*$/
    end
  end


  newproperty(:status) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


end
