Puppet::Type.newtype(:local_host) do
  @doc = 'Defines all possible types for Local Host object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:hostname, :array_matching => :all) do
    desc "Host Name"
    validate do |value|
      fail("Invalid hostname #{value}, Illegal characters present") unless value =~ /^([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-\_]*[a-zA-Z0-9])(\.([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-\_]*[a-zA-Z0-9]))*$/
      fail("Invalid hostname #{value}, Must be no longer than 255 characters") if value.length > 255
    end
  end


  newproperty(:ip_address) do
    desc "IP Address"
  end


end
