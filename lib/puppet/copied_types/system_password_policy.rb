Puppet::Type.newtype(:system_password_policy) do
  @doc = 'Defines all possible types for Password Policy of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:contains, :array_matching => :all) do
    desc "Contains"
    newvalues('Atleast One Upper Case Character', 'Atleast One Lower Case Character', 'Atleast One Special Character', 'Atleast One Digit')
  end


  newproperty(:expiry_time) do
    desc "Expires In"
    defaultto :Never
    newvalues('3 Months', '6 Months', '1 Year', 'Never', 'Other')
  end


  newproperty(:minimum_characters) do
    desc "Minimum Characters"
    defaultto 8
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid minimum_characters #{value}, Must not be lesser than 8") if value < 8
      fail("Invalid minimum_characters #{value}, Must not be greater than 50") if value > 50
    end
  end


  newproperty(:notify_before_expiry) do
    desc "Notify Before Expiry"
    defaultto '1 Week'
    newvalues('1 Week', '2 Weeks')
  end


  newproperty(:other_expiry_time) do
    desc "Expires In"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid other_expiry_time #{value}, Must not be lesser than 30") if value < 30
    end
  end


  newproperty(:policy) do
    desc "Policy"
    defaultto :Default
    newvalues(:Default, :Custom)
  end


end
