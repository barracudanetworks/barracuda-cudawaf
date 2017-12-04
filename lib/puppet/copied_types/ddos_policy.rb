Puppet::Type.newtype(:ddos_policy) do
  @doc = 'Defines all possible types for DDoS Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "DDos Policy Name"
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


  newproperty(:enforce_captcha) do
    desc "Enforce CAPTCHA"
    defaultto 'Do not Enforce'
    newvalues('Do not Enforce', 'Suspicious clients only', 'All clients')
  end


  newproperty(:evaluate_clients) do
    desc "Enable URL ACL"
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:expiry_time) do
    desc "Expiry time"
    defaultto 300
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid expiry_time #{value}, Must not be lesser than 60") if value < 60
      fail("Invalid expiry_time #{value}, Must not be greater than 3600") if value > 3600
    end
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


  newproperty(:host) do
    desc "Host Match"
    defaultto :*
    validate do |value|
      fail("Invalid host #{value}, Illegal characters present") unless value =~ /((^[*])|(^([a-zA-Z0-9.\-\_]*[*]?[a-zA-Z0-9.\-\_]+){2,}))$/
      fail("Invalid host #{value}, Must be no longer than 128 characters") if value.length > 128
    end
  end


  newproperty(:num_captcha_tries) do
    desc "Max CAPTCHA Attempts"
    defaultto 5
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid num_captcha_tries #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid num_captcha_tries #{value}, Must not be greater than 128") if value > 128
    end
  end


  newproperty(:num_unanswered_captcha) do
    desc "Max Unanswered CAPTCHA"
    defaultto 100
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid num_unanswered_captcha #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid num_unanswered_captcha #{value}, Must not be greater than 2096") if value > 2096
    end
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
