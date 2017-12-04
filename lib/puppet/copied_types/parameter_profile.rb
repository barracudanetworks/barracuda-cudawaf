Puppet::Type.newtype(:parameter_profile) do
  @doc = 'Defines all possible types for Parameter Profile object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Parameter Profile Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /(^([a-zA-Z0-9.\-\_]+))$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allowed_file_upload_type) do
    desc "Allowed File Upload Type"
    defaultto :Extensions
    newvalues('Extensions', 'Mime Types')
  end


  newproperty(:allowed_metachars) do
    desc "Allowed Metacharacters"
    validate do |value|
      fail("Invalid allowed_metachars #{value}, Illegal characters present") unless value =~ /^(%[0-9a-fA-F][0-9a-fA-F])*$/
      fail("Invalid allowed_metachars #{value}, Must be no longer than 239 characters") if value.length > 239
    end
  end


  newproperty(:base64_decode_parameter_value) do
    desc "Base64 Decode Parameter Value"
    defaultto :No
    newvalues(:No, :Yes)
  end


  newproperty(:comments) do
    desc "Comments"
  end


  newproperty(:custom_parameter_class) do
    desc "Custom Parameter Class"
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


  newproperty(:ignore) do
    desc "Ignore"
    defaultto :No
    newvalues(:No, :Yes)
  end


  newproperty(:max_value_length) do
    desc "Max Value Length"
    defaultto 1000
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_value_length #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_value_length #{value}, Must not be greater than 1073741824") if value > 1073741824
    end
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


  newproperty(:parameter) do
    desc "Parameter"
    validate do |value|
      fail("Invalid parameter #{value}, Illegal characters present") unless value =~ /.*[^\s]+$/
      fail("Invalid parameter #{value}, Must be no longer than 512 characters") if value.length > 512
    end
  end


  newproperty(:parameter_class) do
    desc "Parameter Class"
    newvalues('', 'CUSTOM', 'Login', 'Search', 'Password', 'Comments', 'Integer', 'Hex Number', 'Alpha', 'Alphanumeric', 'String', 'Generic', 'No validation')
  end


  newproperty(:required) do
    desc "Required"
    defaultto :No
    newvalues(:No, :Yes)
  end


  newproperty(:status) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:type) do
    desc "Type"
    defaultto :Input
    newvalues('Input', 'Read Only', 'Session Choice', 'Global Choice', 'Session Invariant', 'File Upload')
  end


  newproperty(:validate_parameter_name) do
    desc "Validate Parameter Name"
    defaultto :No
    newvalues(:No, :Yes)
  end


  newproperty(:values, :array_matching => :all) do
    desc "Values"
  end


end
