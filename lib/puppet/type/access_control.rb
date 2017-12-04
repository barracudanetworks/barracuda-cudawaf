Puppet::Type.newtype(:access_control) do
  @doc = 'Defines all possible types for Authorization Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:access_denied_url) do
    desc "Access Denied URL"
  end


  newproperty(:access_rules, :array_matching => :all) do
    desc "Access Rules"
  end


  newproperty(:allow_any_authenticated_user) do
    desc "Allow any Authenticated User"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:allowed_groups, :array_matching => :all) do
    desc "Allowed Groups"
  end


  newproperty(:allowed_users, :array_matching => :all) do
    desc "Allowed Users"
  end


  newproperty(:comments) do
    desc "Comments"
  end


  newproperty(:cookie_timeout) do
    desc "Persistent Cookie Timeout"
    defaultto 15
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid cookie_timeout #{value}, Must not be lesser than 5") if value < 5
      fail("Invalid cookie_timeout #{value}, Must not be greater than 600") if value > 600
    end
  end


  newproperty(:extended_match) do
    desc "Extended Match"
    defaultto :*
  end


  newproperty(:extended_match_sequence) do
    desc "Extended Match Sequence"
    defaultto 1000
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid extended_match_sequence #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid extended_match_sequence #{value}, Must not be greater than 1000") if value > 1000
    end
  end


  newproperty(:host) do
    desc "Host Match"
    defaultto :*
  end


  newproperty(:login_method) do
    desc "Login Method"
    defaultto 'HTML Form'
    newvalues('HTML Form', 'HTTP Basic Authentication', 'HTTP ActiveSync')
  end


  newproperty(:login_url) do
    desc "Auth Not Done URL"
  end


  newproperty(:send_basic_auth) do
    desc "Send Basic Authentication"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:send_domain_in_basic_auth) do
    desc "Send Domain in Basic Authentication"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:url) do
    desc "URL Match"
    validate do |value|
      fail("Invalid url #{value}, Illegal characters present") unless value =~ /(^\/([^*?<>&\s])*$)|(^\/[^*?<>&\s]*[*][^*?<>&\s]*$)/
    end
  end


  newproperty(:use_persistent_cookie) do
    desc "Use Persitent Cookie"
    defaultto :No
    newvalues(:Yes, :No)
  end


end
