Puppet::Type.newtype(:credential_server) do
  @doc = 'Defines all possible types for Credential Server object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:armored_browser_type) do
    desc "Armored Browser Type"
    newvalues('Quarri - Protect on Q')
  end


  newproperty(:cache_expiry) do
    desc "Cache Expiry (Seconds)"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid cache_expiry #{value}, Must not be lesser than 300") if value < 300
      fail("Invalid cache_expiry #{value}, Must not be greater than 86400") if value > 86400
    end
  end


  newproperty(:cache_valid_sessions) do
    desc "Cache Valid Sessions"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:ip_address) do
    desc "Server Name/IP Address"
  end


  newproperty(:policy_name) do
    desc "Policy Name"
    validate do |value|
      fail("Invalid policy_name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


  newproperty(:port) do
    desc "Server Port"
    defaultto 8080
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid port #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid port #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:redirect_url) do
    desc "Redirect URL"
  end


end
