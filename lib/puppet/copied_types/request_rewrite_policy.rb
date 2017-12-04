Puppet::Type.newtype(:request_rewrite_policy) do
  @doc = 'Defines all possible types for Request Rewrite Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Rule Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:action) do
    desc "Action"
    defaultto 'Insert Header'
    newvalues('Insert Header', 'Remove Header', 'Rewrite Header', 'Rewrite URL', 'Redirect URL')
  end


  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:condition) do
    desc "Rewrite Condition"
    defaultto :*
  end


  newproperty(:continue_processing) do
    desc "Continue Processing"
    defaultto :Yes
    newvalues(:No, :Yes)
  end


  newproperty(:header) do
    desc "Header Name"
    validate do |value|
      fail("Invalid header #{value}, Illegal characters present") unless value =~ /(^[^,()@;:\/\[\]\?={}"<>\x7F\x00-\x20]*$)/
      fail("Invalid header #{value}, Must be no longer than 512 characters") if value.length > 512
    end
  end


  newproperty(:old_value) do
    desc "Old Value"
  end


  newproperty(:rewrite_value) do
    desc "Rewrite Value"
  end


  newproperty(:sequence_number) do
    desc "Sequence Number"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid sequence_number #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid sequence_number #{value}, Must not be greater than 1499") if value > 1499
    end
  end


end
