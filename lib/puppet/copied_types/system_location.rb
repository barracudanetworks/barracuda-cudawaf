Puppet::Type.newtype(:system_location) do
  @doc = 'Defines all possible types for Location of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:country) do
    desc "Country"
    validate do |value|
      fail("Invalid country #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid country #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:rack) do
    desc "Rack"
    validate do |value|
      fail("Invalid rack #{value}, Illegal characters present") unless value =~ /^[A-Za-z0-9_:]+$/
      fail("Invalid rack #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:slot) do
    desc "Slot"
    validate do |value|
      fail("Invalid slot #{value}, Illegal characters present") unless value =~ /^[A-Za-z0-9_:]+$/
      fail("Invalid slot #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


end
