Puppet::Type.newtype(:radius_authentication_service) do
  @doc = 'Defines all possible types for RADIUS Authentication Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Realm Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 63 characters") if value.length > 63
      fail("Invalid name #{value}, Must be no shorter than 1 characters") if value.length < 1
    end
  end


end
