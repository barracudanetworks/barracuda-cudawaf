Puppet::Type.newtype(:global_acl) do
  @doc = 'Defines all possible types for Global ACL object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "URL ACL Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:action) do
    desc "Action"
    defaultto :Process
    newvalues('Process', 'Allow', 'Allow and Log', 'Deny and Log', 'Deny with no Log', 'Temporary Redirect', 'Permanent Redirect')
  end


  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
      fail("Invalid comments #{value}, Must be no longer than 256 characters") if value.length > 256
    end
  end


  newproperty(:deny_response) do
    desc "Deny Response"
    defaultto 'Response Page'
    newvalues('Reset', 'Response Page', 'Temporary Redirect', 'Permanent Redirect')
  end


  newproperty(:enable) do
    desc "Enable URL ACL"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:extended_match) do
    desc "Extended Match"
    defaultto :*
  end


  newproperty(:extended_match_sequence) do
    desc "Extended Match Sequence"
    defaultto 1
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid extended_match_sequence #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid extended_match_sequence #{value}, Must not be greater than 1000") if value > 1000
    end
  end


  newproperty(:follow_up_action) do
    desc "Follow Up Action"
    defaultto :None
    newvalues('None', 'Block Client-IP', 'Challenge with CAPTCHA')
  end


  newproperty(:follow_up_action_time) do
    desc "Follow Up Action Time"
    defaultto 60
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid follow_up_action_time #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid follow_up_action_time #{value}, Must not be greater than 600000") if value > 600000
    end
  end


  newproperty(:redirect_url) do
    desc "Redirect URL"
    validate do |value|
      fail("Invalid redirect_url #{value}, Illegal characters present") unless value =~ /(^[hH][tT][tT][pP][sS]?[\:][\/][\/][^*]+$)|(^\/([^*])+$)|(^(%s|%b)$)/
      fail("Invalid redirect_url #{value}, Must be no longer than 1024 characters") if value.length > 1024
    end
  end


  newproperty(:response_page) do
    desc "Response Page"
    defaultto :default
  end


  newproperty(:url) do
    desc "URL Match"
    defaultto :/*
    validate do |value|
      fail("Invalid url #{value}, Illegal characters present") unless value =~ /(^\/([^*?<>&\s])*$)|(^\/[^*?<>&\s]*[*][^*?<>&\s]*$)/
      fail("Invalid url #{value}, Must be no longer than 5000 characters") if value.length > 5000
    end
  end


end
