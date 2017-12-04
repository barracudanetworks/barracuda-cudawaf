Puppet::Type.newtype(:json_key_profile) do
  @doc = 'Defines all possible types for JSON Key Profile object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Profile Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allow_null) do
    desc "Allow NULL"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:allowed_metachars) do
    desc "Allowed Metacharacters"
    validate do |value|
      fail("Invalid allowed_metachars #{value}, Illegal characters present") unless value =~ /^(%[0-9a-fA-F][0-9a-fA-F])*$/
      fail("Invalid allowed_metachars #{value}, Must be no longer than 239 characters") if value.length > 239
    end
  end


  newproperty(:base64_decode_parameter_value) do
    desc "Base64 Decode"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:comments) do
    desc "Comments"
  end


  newproperty(:exception_patterns, :array_matching => :all) do
    desc "Exception Patterns"
    validate do |value|
      fail("Invalid exception_patterns #{value}, Illegal characters present") unless value =~ /.*[^\s]+$/
      fail("Invalid exception_patterns #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:key) do
    desc "Key"
    validate do |value|
      fail("Invalid key #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid key #{value}, Must be no longer than 5000 characters") if value.length > 5000
    end
  end


  newproperty(:max_array_elements) do
    desc "Max Array Elements"
    defaultto 64
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_array_elements #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_array_elements #{value}, Must not be greater than 1024") if value > 1024
    end
  end


  newproperty(:max_keys) do
    desc "Max Number Of Keys"
    defaultto 256
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_keys #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_keys #{value}, Must not be greater than 16384") if value > 16384
    end
  end


  newproperty(:max_length) do
    desc "Max Length"
    defaultto 1024
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_length #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_length #{value}, Must not be greater than 8192") if value > 8192
    end
  end


  newproperty(:max_number_value) do
    desc "Max Number Value"
    defaultto 32768
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_number_value #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_number_value #{value}, Must not be greater than 1.84467440737096e+19") if value > 1.84467440737096e+19
    end
  end


  newproperty(:status) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:validate_key) do
    desc "Validate Key"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:value_class) do
    desc "Custom Parameter Class"
  end


  newproperty(:value_type) do
    desc "Value Type"
    defaultto :Any
    newvalues(:Any, :String, :Number, :Array, :Object)
  end


end
