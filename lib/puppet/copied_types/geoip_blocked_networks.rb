Puppet::Type.newtype(:geoip_blocked_networks) do
  @doc = 'Defines all possible types for GeoIP Blocked Networks object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:block_ip, :array_matching => :all) do
    desc "Blocked Networks"
    validate do |value|
      fail("Invalid block_ip #{value}, Illegal characters present") unless value =~ /^[[:alnum:]*\.\-\_]*$/
    end
  end


  newproperty(:block_netmask) do
    desc "Netmask"
  end


  newproperty(:comment) do
    desc "Comment"
  end


end
