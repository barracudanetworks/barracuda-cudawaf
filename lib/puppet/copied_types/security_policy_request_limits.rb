Puppet::Type.newtype(:security_policy_request_limits) do
  @doc = 'Defines all possible types for Request Limits of Security Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:enable) do
    desc "Enable Request Limits"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:max_cookie_name_length) do
    desc "Max Cookie Name Length"
    defaultto 64
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_cookie_name_length #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_cookie_name_length #{value}, Must not be greater than 1024") if value > 1024
    end
  end


  newproperty(:max_cookie_value_length) do
    desc "Max Cookie Value Length"
    defaultto 4096
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_cookie_value_length #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_cookie_value_length #{value}, Must not be greater than 32768") if value > 32768
    end
  end


  newproperty(:max_header_name_length) do
    desc "Max Header Name Length"
    defaultto 32
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_header_name_length #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_header_name_length #{value}, Must not be greater than 1024") if value > 1024
    end
  end


  newproperty(:max_header_value_length) do
    desc "Max Header Value Length"
    defaultto 1024
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_header_value_length #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_header_value_length #{value}, Must not be greater than 65536") if value > 65536
    end
  end


  newproperty(:max_number_of_cookies) do
    desc "Max Number of Cookies"
    defaultto 40
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_number_of_cookies #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_number_of_cookies #{value}, Must not be greater than 1024") if value > 1024
    end
  end


  newproperty(:max_number_of_headers) do
    desc "Max Number of Headers"
    defaultto 20
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_number_of_headers #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_number_of_headers #{value}, Must not be greater than 40") if value > 40
    end
  end


  newproperty(:max_query_length) do
    desc "Max Query Length"
    defaultto 4096
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_query_length #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_query_length #{value}, Must not be greater than 60000") if value > 60000
    end
  end


  newproperty(:max_request_length) do
    desc "Max Request Length"
    defaultto 32768
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_request_length #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_request_length #{value}, Must not be greater than 65536") if value > 65536
    end
  end


  newproperty(:max_request_line_length) do
    desc "Max Request Line Length"
    defaultto 4096
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_request_line_length #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_request_line_length #{value}, Must not be greater than 65536") if value > 65536
    end
  end


  newproperty(:max_url_length) do
    desc "Max URL Length"
    defaultto 4096
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_url_length #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_url_length #{value}, Must not be greater than 131072") if value > 131072
    end
  end


end
