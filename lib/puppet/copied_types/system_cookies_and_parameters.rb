Puppet::Type.newtype(:system_cookies_and_parameters) do
  @doc = 'Defines all possible types for Cookies And Parameters of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:access_control_cookie) do
    desc "Access Control Cookie"
    defaultto :AuthzInfo
    validate do |value|
      fail("Invalid access_control_cookie #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid access_control_cookie #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


  newproperty(:basic_challenge_cookie) do
    desc "Basic Challenge Cookie"
    defaultto :BasicChallenge
    validate do |value|
      fail("Invalid basic_challenge_cookie #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid basic_challenge_cookie #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


  newproperty(:bne_cookie_prefix) do
    desc "External Cookie Prefix"
    defaultto :BNE_
    validate do |value|
      fail("Invalid bne_cookie_prefix #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid bne_cookie_prefix #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


  newproperty(:external_secure_cookie_prefix) do
    desc "External Secure Cookie Prefix"
    defaultto :BNES_
    validate do |value|
      fail("Invalid external_secure_cookie_prefix #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid external_secure_cookie_prefix #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


  newproperty(:forced_charset_parameter) do
    desc "Forced Charset Parameter"
    defaultto :nccharset
    validate do |value|
      fail("Invalid forced_charset_parameter #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid forced_charset_parameter #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


  newproperty(:internal_cookie_prefix) do
    desc "Internal Cookie Prefix"
    defaultto :BNI_
    validate do |value|
      fail("Invalid internal_cookie_prefix #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid internal_cookie_prefix #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


  newproperty(:internal_secure_cookie_prefix) do
    desc "Internal Secure Cookie Prefix"
    defaultto :BNIS_
    validate do |value|
      fail("Invalid internal_secure_cookie_prefix #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid internal_secure_cookie_prefix #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


  newproperty(:rsa_state_cookie) do
    desc "Secure Form Tracking Parameter"
    defaultto :State
    validate do |value|
      fail("Invalid rsa_state_cookie #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid rsa_state_cookie #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


  newproperty(:secure_form_tracking_parameter) do
    desc "Secure Form Tracking Parameter"
    defaultto :__ncforminfo
    validate do |value|
      fail("Invalid secure_form_tracking_parameter #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid secure_form_tracking_parameter #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


  newproperty(:success_url_cookie) do
    desc "Authentication Success URL Cookie"
    defaultto :AuthSuccessURL
    validate do |value|
      fail("Invalid success_url_cookie #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid success_url_cookie #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


  newproperty(:user_session_cookie) do
    desc "User Session Cookie"
    defaultto :USR_SESSION_ID
    validate do |value|
      fail("Invalid user_session_cookie #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._-]*$/
      fail("Invalid user_session_cookie #{value}, Must be no longer than 20 characters") if value.length > 20
    end
  end


end
