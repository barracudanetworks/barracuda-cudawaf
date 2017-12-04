Puppet::Type.newtype(:header_acl) do
  @doc = 'Defines all possible types for Header ACL object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Header ACL Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 78 characters") if value.length > 78
    end
  end


  newproperty(:blocked_attack_types, :array_matching => :all) do
    desc "Blocked Attack Types"
  end


  newproperty(:comments) do
    desc "Comments"
  end


  newproperty(:custom_blocked_attack_types, :array_matching => :all) do
    desc "Custom Blocked Attack Types"
  end


  newproperty(:denied_metachars) do
    desc "Denied Metacharacters"
    defaultto :%00%01%04%1b%08%5c%7f
    validate do |value|
      fail("Invalid denied_metachars #{value}, Illegal characters present") unless value =~ /^(%[0-9a-fA-F][0-9a-fA-F])*$/
      fail("Invalid denied_metachars #{value}, Must be no longer than 239 characters") if value.length > 239
    end
  end


  newproperty(:header_name) do
    desc "Header Name"
    validate do |value|
      fail("Invalid header_name #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\-\*]*$|(\*)/
    end
  end


  newproperty(:max_header_value_length) do
    desc "Max Header Value Length"
    defaultto 1024
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_header_value_length #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_header_value_length #{value}, Must not be greater than 65536") if value > 65536
    end
  end


  newproperty(:mode) do
    desc "Mode"
    defaultto :Active
    newvalues(:Passive, :Active)
  end


  newproperty(:status) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


end
