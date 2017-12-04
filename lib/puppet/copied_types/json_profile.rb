Puppet::Type.newtype(:json_profile) do
  @doc = 'Defines all possible types for JSON Profile object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "JSON Profile Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allowed_content_types, :array_matching => :all) do
    desc "Inspect Mime Types"
    defaultto :application/json
  end


  newproperty(:comment) do
    desc "Comments"
  end


  newproperty(:host_match) do
    desc "Host Match"
    validate do |value|
      fail("Invalid host_match #{value}, Illegal characters present") unless value =~ /((^[*])|(^([a-zA-Z0-9.\-\_]*[*]?[a-zA-Z0-9.\-\_]+){2,}))$/
      fail("Invalid host_match #{value}, Must be no longer than 5000 characters") if value.length > 5000
    end
  end


  newproperty(:json_policy) do
    desc "JSON Policy"
    defaultto :default-policy
  end


  newproperty(:method, :array_matching => :all) do
    desc "Methods"
  end


  newproperty(:mode) do
    desc "Mode"
    defaultto :Active
    newvalues(:Active, :Passive)
  end


  newproperty(:status) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:url_match) do
    desc "URL Match"
    validate do |value|
      fail("Invalid url_match #{value}, Illegal characters present") unless value =~ /(^\/([^*?<>&\s])*$)|(^\/[^*?<>&\s]*[*][^*?<>&\s]*$)/
      fail("Invalid url_match #{value}, Must be no longer than 5000 characters") if value.length > 5000
    end
  end


  newproperty(:validate_key) do
    desc "Validate Key"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


end
