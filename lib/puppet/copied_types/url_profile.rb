Puppet::Type.newtype(:url_profile) do
  @doc = 'Defines all possible types for URL Profile object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "URL Profile Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allow_query_string) do
    desc "Allow Query String"
    defaultto :Yes
    newvalues(:No, :Yes)
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


  newproperty(:comment) do
    desc "Comments"
  end


  newproperty(:csrf_prevention) do
    desc "CSRF Prevention"
    defaultto :None
    newvalues('None', 'Forms', 'Forms and URLs')
  end


  newproperty(:custom_blocked_attack_types, :array_matching => :all) do
    desc "Custom Blocked Attack Types"
  end


  newproperty(:display_name) do
    desc "Display Name"
  end


  newproperty(:exception_patterns, :array_matching => :all) do
    desc "Exception Patterns"
    validate do |value|
      fail("Invalid exception_patterns #{value}, Illegal characters present") unless value =~ /.*[^\s]+$/
      fail("Invalid exception_patterns #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:extended_match) do
    desc "Extended Match"
    defaultto :*
  end


  newproperty(:extended_match_sequence) do
    desc "Extended Match Sequence"
    defaultto 1
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid extended_match_sequence #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid extended_match_sequence #{value}, Must not be greater than 1000") if value > 1000
    end
  end


  newproperty(:hidden_parameter_protection) do
    desc "Hidden Parameter Protection"
    defaultto :Forms
    newvalues('None', 'Forms', 'Forms and URLs')
  end


  newproperty(:max_content_length) do
    desc "Max Content Length"
    defaultto 32768
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_content_length #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_content_length #{value}, Must not be greater than 1073741824") if value > 1073741824
    end
  end


  newproperty(:maximum_parameter_name_length) do
    desc "Maximum Parameter Name Length"
    defaultto 64
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid maximum_parameter_name_length #{value}, Must not be lesser than 0") if value < 0
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


  newproperty(:mode) do
    desc "Mode"
    defaultto :Passive
    newvalues(:Learning, :Passive, :Active)
  end


  newproperty(:referrers_for_the_url_profile, :array_matching => :all) do
    desc "Referrers for the URL Profile"
  end


  newproperty(:status) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:url) do
    desc "URL"
    validate do |value|
      fail("Invalid url #{value}, Illegal characters present") unless value =~ /(^\/([^*?<>\s])*$)|(^\/[^*?<>\s]*[*][^*?<>\s]*$)/
      fail("Invalid url #{value}, Must be no longer than 5000 characters") if value.length > 5000
    end
  end


end
