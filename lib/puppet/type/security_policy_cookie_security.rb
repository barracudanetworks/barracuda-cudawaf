Puppet::Type.newtype(:security_policy_cookie_security) do
  @doc = 'Defines all possible types for Cookie Security of Security Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allow_unrecognized_cookies) do
    desc "Allow Unrecognized Cookies"
    defaultto :Custom
    newvalues(:Never, :Always, :Custom)
  end


  newproperty(:cookie_max_age) do
    desc "Cookie Max Age"
    defaultto 1440
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid cookie_max_age #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid cookie_max_age #{value}, Must not be greater than 500000") if value > 500000
    end
  end


  newproperty(:cookie_replay_protection_type) do
    desc "Cookie Replay Protection Type"
    defaultto :IP
    newvalues('none', 'IP', 'Custom Headers', 'IP and Custom Headers')
  end


  newproperty(:cookies_exempted, :array_matching => :all) do
    desc "Cookies Exempted"
    validate do |value|
      fail("Invalid cookies_exempted #{value}, Illegal characters present") unless value =~ /^[[:alnum:]\._%~#\*\-\[\]]*$/
      fail("Invalid cookies_exempted #{value}, Must be no longer than 63 characters") if value.length > 63
    end
  end


  newproperty(:custom_headers, :array_matching => :all) do
    desc "Custom Headers"
  end


  newproperty(:days_allowed) do
    desc "Days Allowed"
    defaultto :7
    validate do |value|
      fail("Invalid days_allowed #{value}, Illegal characters present") unless value =~ /^((Never)|(Always)|([1-9]+[0-9]*))$/
      fail("Invalid days_allowed #{value}, Must not be greater than 999999999") if value > 999999999
    end
  end


  newproperty(:http_only) do
    desc "HTTP Only"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:secure_cookie) do
    desc "Secure Cookie"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:tamper_proof_mode) do
    desc "Tamper Proof Mode"
    defaultto :Signed
    newvalues(:Encrypted, :Signed, :None)
  end


end
