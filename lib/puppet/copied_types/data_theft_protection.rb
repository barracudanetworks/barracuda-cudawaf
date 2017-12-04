Puppet::Type.newtype(:data_theft_protection) do
  @doc = 'Defines all possible types for Data Theft Protection object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Data Theft Element Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:action) do
    desc "Action"
    defaultto :Block
    newvalues(:Block, :Cloak)
  end


  newproperty(:custom_identity_theft_type) do
    desc "Custom Identity Theft Type"
  end


  newproperty(:enable) do
    desc "Enabled"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:identity_theft_type) do
    desc "Identity Theft Type"
    defaultto :CUSTOM
    newvalues('CUSTOM', 'Credit Cards', 'Social Security Numbers', 'Directory Indexing', 'Microsoft Errors', 'Oracle Errors', 'PHP Errors', 'PostgreS Errors', 'MySQL Errors')
  end


  newproperty(:initial_characters_to_keep) do
    desc "Initial Characters to Keep"
    defaultto 0
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid initial_characters_to_keep #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid initial_characters_to_keep #{value}, Must not be greater than 100") if value > 100
    end
  end


  newproperty(:trailing_characters_to_keep) do
    desc "Trailing Characters to Keep"
    defaultto 4
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid trailing_characters_to_keep #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid trailing_characters_to_keep #{value}, Must not be greater than 100") if value > 100
    end
  end


end
