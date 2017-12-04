Puppet::Type.newtype(:response_body_rewrite_policy) do
  @doc = 'Defines all possible types for Response Body Rewrite Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Rule Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:host) do
    desc "Host Match"
    validate do |value|
      fail("Invalid host #{value}, Illegal characters present") unless value =~ /((^[*])|(^([a-zA-Z0-9.\-\_]*[*]?[a-zA-Z0-9.\-\_]+){2,}))$/
    end
  end


  newproperty(:replace_string) do
    desc "Replace String"
  end


  newproperty(:search_string) do
    desc "Search String"
  end


  newproperty(:sequence_number) do
    desc "Sequence number"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid sequence_number #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid sequence_number #{value}, Must not be greater than 1499") if value > 1499
    end
  end


  newproperty(:url) do
    desc "URL Match"
    validate do |value|
      fail("Invalid url #{value}, Illegal characters present") unless value =~ /(^\/([^*?<>&\s])*$)|(^\/[^*?<>&\s]*[*][^*?<>&\s]*$)/
    end
  end


end
