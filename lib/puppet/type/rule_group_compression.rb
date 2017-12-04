Puppet::Type.newtype(:rule_group_compression) do
  @doc = 'Defines all possible types for Compression of Rule Group object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Rule Group Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:compress_unknown_content_types) do
    desc "Compress Others"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:content_types, :array_matching => :all) do
    desc "Content Types"
    validate do |value|
      fail("Invalid content_types #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z\-]*[/].*$/
    end
  end


  newproperty(:min_size) do
    desc "Min Size (B)"
    defaultto 8192
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid min_size #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid min_size #{value}, Must not be greater than 2147483646") if value > 2147483646
    end
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


end
