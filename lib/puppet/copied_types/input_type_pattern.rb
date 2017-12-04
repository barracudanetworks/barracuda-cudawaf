Puppet::Type.newtype(:input_type_pattern) do
  @doc = 'Defines all possible types for Input Type Pattern object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Pattern Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:algorithm) do
    desc "Pattern Algorithm"
    defaultto :None
    newvalues('None', 'Credit Card Check Digit', 'Korean Resident Registration Number Check Digit')
  end


  newproperty(:case_sensitive) do
    desc "Case Sensitivity"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:description) do
    desc "Pattern Description"
    validate do |value|
      fail("Invalid description #{value}, Illegal characters present") unless value =~ /^.*$/
      fail("Invalid description #{value}, Must be no longer than 512 characters") if value.length > 512
      fail("Invalid description #{value}, Must be no shorter than 0 characters") if value.length < 0
    end
  end


  newproperty(:regex) do
    desc "Pattern Regex"
  end


  newproperty(:status) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


end
