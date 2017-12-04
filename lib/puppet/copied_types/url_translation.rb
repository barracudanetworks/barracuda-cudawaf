Puppet::Type.newtype(:url_translation) do
  @doc = 'Defines all possible types for URL Translation object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Rule Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:inside_domain) do
    desc "Inside Domain"
    validate do |value|
      fail("Invalid inside_domain #{value}, Illegal characters present") unless value =~ /(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9.]$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][0-9]{1,4}$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][0-5][0-9]{4}$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][6][0-4][0-9]{3}$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][6][5][0-4][0-9]{2}$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][6][5][5][0-2][0-9]$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][6][5][5][3][0-5]$)/
      fail("Invalid inside_domain #{value}, Must be no longer than 254 characters") if value.length > 254
    end
  end


  newproperty(:inside_prefix) do
    desc "Inside Prefix"
    validate do |value|
      fail("Invalid inside_prefix #{value}, Illegal characters present") unless value =~ /(^\/[^?]*$)/
      fail("Invalid inside_prefix #{value}, Must be no longer than 512 characters") if value.length > 512
    end
  end


  newproperty(:outside_domain) do
    desc "Outside Domain"
    validate do |value|
      fail("Invalid outside_domain #{value}, Illegal characters present") unless value =~ /(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9.]$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][0-9]{1,4}$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][0-5][0-9]{4}$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][6][0-4][0-9]{3}$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][6][5][0-4][0-9]{2}$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][6][5][5][0-2][0-9]$)|(^[a-zA-Z0-9.][a-zA-Z0-9.\-\_]*[a-zA-Z0-9][:][6][5][5][3][0-5]$)/
      fail("Invalid outside_domain #{value}, Must be no longer than 254 characters") if value.length > 254
    end
  end


  newproperty(:outside_prefix) do
    desc "Outside Prefix"
    validate do |value|
      fail("Invalid outside_prefix #{value}, Illegal characters present") unless value =~ /(^\/[^?]*$)/
      fail("Invalid outside_prefix #{value}, Must be no longer than 512 characters") if value.length > 512
    end
  end


end
