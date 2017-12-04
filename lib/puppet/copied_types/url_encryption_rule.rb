Puppet::Type.newtype(:url_encryption_rule) do
  @doc = 'Defines all possible types for URL Encryption Rule object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "URL Encryption Rule Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allow_unencrypted_requests) do
    desc "Allow Unencrypted Request"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:exclude_urls, :array_matching => :all) do
    desc "Exclude URL Patterns"
    validate do |value|
      fail("Invalid exclude_urls #{value}, Illegal characters present") unless value =~ /^[\/\*][A-Za-z0-9_\-\.\/\*]+$/
      fail("Invalid exclude_urls #{value}, Must be no longer than 512 characters") if value.length > 512
    end
  end


  newproperty(:host) do
    desc "Host Match"
    validate do |value|
      fail("Invalid host #{value}, Illegal characters present") unless value =~ /((^[*])|(^([a-zA-Z0-9.\-\_]*[*]?[a-zA-Z0-9.\-\_]+){2,}))$/
      fail("Invalid host #{value}, Must be no longer than 128 characters") if value.length > 128
    end
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
