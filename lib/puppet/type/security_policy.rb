Puppet::Type.newtype(:security_policy) do
  @doc = 'Defines all possible types for a Security Policy object on the Barracuda Web Application Firewall.'
  ensurable
  newparam(:name, :namevar => true) do
    desc "Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end
end
