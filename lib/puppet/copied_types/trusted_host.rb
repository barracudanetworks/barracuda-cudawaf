Puppet::Type.newtype(:trusted_host) do
  @doc = 'Defines all possible types for Trusted Host object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Trusted Host Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
      fail("Invalid comments #{value}, Must be no longer than 256 characters") if value.length > 256
    end
  end


  newproperty(:ip_address) do
    desc "IP Address"
  end


  newproperty(:ipv6_address) do
    desc "IP Address"
  end


  newproperty(:ipv6_mask) do
    desc "Mask"
  end


  newproperty(:mask) do
    desc "Mask"
  end


  newproperty(:version) do
    desc "Version"
    defaultto :IPv4
    newvalues(:IPv4, :IPv6)
  end


end
