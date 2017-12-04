Puppet::Type.newtype(:whitelisted_bot) do
  @doc = 'Defines all possible types for Whitelisted Bot object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Parent Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:host, :array_matching => :all) do
    desc "Host"
    validate do |value|
      fail("Invalid host #{value}, Illegal characters present") unless value =~ /((^[*])|(^([a-zA-Z0-9.\-\_]*[*]?[a-zA-Z0-9.\-\_]+){2,}))$/
      fail("Invalid host #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:identifier) do
    desc "Whitelist Identifier"
    defaultto :Host
    newvalues('Host', 'IP Addresses')
  end


  newproperty(:ip_address, :array_matching => :all) do
    desc "IP Addresses"
  end


  newproperty(:user_agent, :array_matching => :all) do
    desc "User Agent"
  end


end
