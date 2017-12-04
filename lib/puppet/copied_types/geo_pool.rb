Puppet::Type.newtype(:geo_pool) do
  @doc = 'Defines all possible types for GEO Pool object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Geo Pool Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 30 characters") if value.length > 30
    end
  end


  newproperty(:region) do
    desc "Available Categories"
  end


end
