Puppet::Type.newtype(:session_information) do
  @doc = 'Defines all possible types for Session Identifiers object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Session Identifier Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:end_delimiter) do
    desc "URL Session Token End Delimiter"
    defaultto :;
  end


  newproperty(:start_delimiter) do
    desc "URL Session Token Start Delimiter"
    defaultto :=
  end


  newproperty(:token_name) do
    desc "Session Token Name"
    validate do |value|
      fail("Invalid token_name #{value}, Illegal characters present") unless value =~ /^[;[:alpha:]][[:alnum:]._;-]*$/
    end
  end


  newproperty(:token_type) do
    desc "Session Token Type"
    newvalues('Parameter', 'Parameter Suffix', 'Parameter Prefix', 'Cookie', 'Cookie Suffix', 'Cookie Prefix', 'URL Path', 'URL Path Suffix', 'URL Path Prefix')
  end


end
