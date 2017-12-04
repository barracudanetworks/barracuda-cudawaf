Puppet::Type.newtype(:service_group) do
  @doc = 'Defines all possible types for Service Group object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:service_group, :array_matching => :all) do
    desc "Service Group"
    validate do |value|
      fail("Invalid service_group #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


end
