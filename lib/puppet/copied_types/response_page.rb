Puppet::Type.newtype(:response_page) do
  @doc = 'Defines all possible types for Response Page object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Response Page Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:body) do
    desc "Body"
  end


  newproperty(:headers, :array_matching => :all) do
    desc "Headers"
  end


  newproperty(:status_code) do
    desc "Status Code"
    validate do |value|
      fail("Invalid status_code #{value}, Illegal characters present") unless value =~ /(^[0-9]{3}([ ][^ ]+)+)/
      fail("Invalid status_code #{value}, Must be no longer than 128 characters") if value.length > 128
    end
  end


  newproperty(:type) do
    desc "Session Token Type"
    defaultto 'Error Pages'
    newvalues('Error Pages', 'Captcha Pages', 'Access Control Pages', 'Other Pages')
  end


end
