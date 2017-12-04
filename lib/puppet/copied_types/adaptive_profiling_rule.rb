Puppet::Type.newtype(:adaptive_profiling_rule) do
  @doc = 'Defines all possible types for Adaptive Profiling Rule object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Learn Rule Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:host) do
    desc "Host Match"
  end


  newproperty(:learn_from_request) do
    desc "Learn From Request"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:learn_from_response) do
    desc "Learn From Response"
    defaultto :Yes
    newvalues(:Yes, :No)
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
      fail("Invalid url #{value}, Must be no longer than 5000 characters") if value.length > 5000
    end
  end


end
