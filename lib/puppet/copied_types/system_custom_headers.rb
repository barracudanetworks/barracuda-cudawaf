Puppet::Type.newtype(:system_custom_headers) do
  @doc = 'Defines all possible types for Custom Headers of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:header1) do
    desc "Custom Header1"
    validate do |value|
      fail("Invalid header1 #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid header1 #{value}, Must be no longer than 128 characters") if value.length > 128
      fail("Invalid header1 #{value}, Must be no shorter than 1 characters") if value.length < 1
    end
  end


  newproperty(:header2) do
    desc "Custom Header2"
    validate do |value|
      fail("Invalid header2 #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid header2 #{value}, Must be no longer than 128 characters") if value.length > 128
      fail("Invalid header2 #{value}, Must be no shorter than 1 characters") if value.length < 1
    end
  end


  newproperty(:header3) do
    desc "Custom Header3"
    validate do |value|
      fail("Invalid header3 #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid header3 #{value}, Must be no longer than 128 characters") if value.length > 128
      fail("Invalid header3 #{value}, Must be no shorter than 1 characters") if value.length < 1
    end
  end


end
