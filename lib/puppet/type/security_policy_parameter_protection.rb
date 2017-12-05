Puppet::Type.newtype(:security_policy_parameter_protection) do
  @doc = 'Defines all possible types for Parameter Protection of Security Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allowed_file_upload_type) do
    desc "Allowed File Upload Type"
    defaultto :Extensions
    newvalues('Extensions', 'Mime Types')
  end


  newproperty(:base64_decode_parameter_value) do
    desc "Base64 Decode Parameter Value"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:blocked_attack_types, :array_matching => :all) do
    desc "Blocked Attack Types"
  end


  newproperty(:custom_blocked_attack_types, :array_matching => :all) do
    desc "Custom Blocked Attack Types"
  end


  newproperty(:denied_metacharacters) do
    desc "Denied Metacharacters"
    defaultto "%00%01%04%1b%08%5c%7f"
    validate do |value|
      fail("Invalid denied_metacharacters #{value}, Illegal characters present") unless value =~ /^(%[0-9a-fA-F][0-9a-fA-F])*$/
      fail("Invalid denied_metacharacters #{value}, Must be no longer than 239 characters") if value.length > 239
    end
  end


  newproperty(:enable) do
    desc "Enable Parameter Protection"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:exception_patterns, :array_matching => :all) do
    desc "Exception Patterns"
    validate do |value|
      fail("Invalid exception_patterns #{value}, Illegal characters present") unless value =~ /.*[^\s]+$/
      fail("Invalid exception_patterns #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:file_upload_extensions, :array_matching => :all) do
    desc "File Upload Extensions"
  end


  newproperty(:file_upload_mime_types, :array_matching => :all) do
    desc "File Upload Mime Types"
  end


  newproperty(:ignore_parameters, :array_matching => :all) do
    desc "Ignore Parameters"
  end


  newproperty(:maximum_instances) do
    desc "Maximum Instances"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid maximum_instances #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid maximum_instances #{value}, Must not be greater than 32767") if value > 32767
    end
  end


  newproperty(:maximum_parameter_value_length) do
    desc "Maximum Parameter Value Length"
    defaultto 1000
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid maximum_parameter_value_length #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid maximum_parameter_value_length #{value}, Must not be greater than 1073741824") if value > 1073741824
    end
  end


  newproperty(:maximum_upload_file_size) do
    desc "Maximum Upload File Size"
    defaultto 1024
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid maximum_upload_file_size #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid maximum_upload_file_size #{value}, Must not be greater than 51200") if value > 51200
    end
  end


  newproperty(:validate_parameter_name) do
    desc "Validate Parameter Name"
    defaultto :No
    newvalues(:Yes, :No)
  end


end
