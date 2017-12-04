Puppet::Type.newtype(:geoip_allowed_networks) do
  @doc = 'Defines all possible types for GeoIP Allowed Networks object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:allow_ip, :array_matching => :all) do
    desc "Allowed Networks"
    validate do |value|
      fail("Invalid allow_ip #{value}, Illegal characters present") unless value =~ /^[[:alnum:]*\.\-\_]*$/
    end
  end


  newproperty(:allow_netmask) do
    desc "Netmask"
  end


  newproperty(:comment) do
    desc "Comment"
  end


end
