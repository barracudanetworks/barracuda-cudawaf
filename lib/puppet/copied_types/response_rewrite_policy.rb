Puppet::Type.newtype(:response_rewrite_policy) do
  @doc = 'Defines all possible types for Response Rewrite Policy object on the Barracuda Web Application Firewall.'

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
    newvalues('Insert Header', 'Remove Header', 'Rewrite Header')
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
  end


  newproperty(:old_value) do
    desc "Old Value"
  end


  newproperty(:rewrite_value) do
    desc "Rewrite Value"
  end


  newproperty(:sequence_number) do
    desc "Sequence number"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid sequence_number #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid sequence_number #{value}, Must not be greater than 2048") if value > 2048
    end
  end


end
