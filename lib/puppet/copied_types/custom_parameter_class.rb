Puppet::Type.newtype(:custom_parameter_class) do
  @doc = 'Defines all possible types for Custom Parameter Class object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Custom Parameter Class Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:blocked_attack_types, :array_matching => :all) do
    desc "Blocked Attack Types"
  end


  newproperty(:custom_blocked_attack_types, :array_matching => :all) do
    desc "Custom Blocked Attack Types"
  end


  newproperty(:custom_input_type_validation) do
    desc "Custom Input Type Validation"
  end


  newproperty(:denied_metacharacters) do
    desc "Denied Metacharacters"
    validate do |value|
      fail("Invalid denied_metacharacters #{value}, Illegal characters present") unless value =~ /^(%[0-9a-fA-F][0-9a-fA-F])*$/
      fail("Invalid denied_metacharacters #{value}, Must be no longer than 239 characters") if value.length > 239
    end
  end


  newproperty(:input_type_validation) do
    desc "Input Type Validation"
    defaultto :NONE
    newvalues('CUSTOM', 'NONE', 'Numeric', 'Hex Number', 'Alpha', 'Alphanumeric', 'Credit Cards', 'Date', 'String', 'Name')
  end


end
