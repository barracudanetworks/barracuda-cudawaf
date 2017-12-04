Puppet::Type.newtype(:security_policy_cloaking) do
  @doc = 'Defines all possible types for Cloaking of Security Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:filter_response_header) do
    desc "Filter Response Header"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:headers_to_filter, :array_matching => :all) do
    desc "Headers to Filter"
    validate do |value|
      fail("Invalid headers_to_filter #{value}, Illegal characters present") unless value =~ /(^[^,()@;:\/\[\]\?={}"<>\x7F\x00-\x20]*$)/
      fail("Invalid headers_to_filter #{value}, Must be no longer than 79 characters") if value.length > 79
    end
  end


  newproperty(:return_codes_to_exempt, :array_matching => :all) do
    desc "Return Codes to Exempt"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid return_codes_to_exempt #{value}, Illegal characters present") unless value =~ /(^[^,()@;:\/\[\]\?={}"<>\x7F\x00-\x20]*$)/
      fail("Invalid return_codes_to_exempt #{value}, Must not be lesser than 400") if value < 400
      fail("Invalid return_codes_to_exempt #{value}, Must not be greater than 599") if value > 599
    end
  end


  newproperty(:suppress_return_code) do
    desc "Suppress Return Code"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


end
