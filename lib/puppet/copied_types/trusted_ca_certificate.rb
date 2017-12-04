Puppet::Type.newtype(:trusted_ca_certificate) do
  @doc = 'Defines all possible types for Trusted CA Certificate object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc ""
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


end
