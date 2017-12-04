Puppet::Type.newtype(:security_policy_url_protection) do
  @doc = 'Defines all possible types for Url Protection of Security Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allowed_content_types, :array_matching => :all) do
    desc "Allowed Content Types"
  end


  newproperty(:allowed_methods, :array_matching => :all) do
    desc "Allowed Methods"
    validate do |value|
      fail("Invalid allowed_methods #{value}, Illegal characters present") unless value =~ /^[[:alpha:]_]*$/
      fail("Invalid allowed_methods #{value}, Must be no longer than 512 characters") if value.length > 512
    end
  end


  newproperty(:blocked_attack_types, :array_matching => :all) do
    desc "Blocked Attack Types"
  end


  newproperty(:csrf_prevention) do
    desc "CSRF Prevention"
    defaultto :None
    newvalues('None', 'Forms', 'Forms and URLs')
  end


  newproperty(:custom_blocked_attack_types, :array_matching => :all) do
    desc "Custom Blocked Attack Types"
  end


  newproperty(:enable) do
    desc "Enable URL Protection"
    defaultto :Enable
    newvalues(:Enable, :Disable)
  end


  newproperty(:exception_patterns, :array_matching => :all) do
    desc "Exception Patterns"
    validate do |value|
      fail("Invalid exception_patterns #{value}, Illegal characters present") unless value =~ /.*[^\s]+$/
      fail("Invalid exception_patterns #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:max_content_length) do
    desc "Max Content Length"
    defaultto 32768
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_content_length #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_content_length #{value}, Must not be greater than 8388608") if value > 8388608
    end
  end


  newproperty(:max_parameters) do
    desc "Max Parameters"
    defaultto 40
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_parameters #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_parameters #{value}, Must not be greater than 1024") if value > 1024
    end
  end


  newproperty(:maximum_parameter_name_length) do
    desc "Maximum Parameter Name Length"
    defaultto 64
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid maximum_parameter_name_length #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid maximum_parameter_name_length #{value}, Must not be greater than 1024") if value > 1024
    end
  end


  newproperty(:maximum_upload_files) do
    desc "Maximum Upload Files"
    defaultto 5
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid maximum_upload_files #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid maximum_upload_files #{value}, Must not be greater than 1024") if value > 1024
    end
  end


end
