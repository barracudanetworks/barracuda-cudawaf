Puppet::Type.newtype(:secure_browsing_policy) do
  @doc = 'Defines all possible types for Secure Browsing Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:comments) do
    desc "Comments"
  end


  newproperty(:credential_server) do
    desc "Credential Server"
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


  newproperty(:status) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:url) do
    desc "URL Match"
    validate do |value|
      fail("Invalid url #{value}, Illegal characters present") unless value =~ /(^\/([^*?<>&\s])*$)|(^\/[^*?<>&\s]*[*][^*?<>&\s]*$)/
    end
  end


end
