Puppet::Type.newtype(:action_policy) do
  @doc = 'Defines all possible types for Action Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Attack Action Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


  newproperty(:action) do
    desc "Action"
    defaultto 'Protect and Log'
    newvalues('Protect and Log', 'Protect with no Log', 'Allow and Log', 'None')
  end


  newproperty(:deny_response) do
    desc "Deny Response"
    defaultto 'Send Response'
    newvalues('Close Connection', 'Send Response', 'Temporary Redirect', 'Permanent Redirect')
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


  newproperty(:numeric_id) do
    desc "Attack Description"
  end


  newproperty(:redirect_url) do
    desc "Redirect URL"
    validate do |value|
      fail("Invalid redirect_url #{value}, Illegal characters present") unless value =~ /(^[hH][tT][tT][pP][sS]?[\:][\/][\/][^*]+$)|(^\/([^*])+$)|(^(%s|%b)$)/
      fail("Invalid redirect_url #{value}, Must be no longer than 256 characters") if value.length > 256
    end
  end


  newproperty(:response_page) do
    desc "Response Page"
    validate do |value|
      fail("Invalid response_page #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


end
