Puppet::Type.newtype(:server_in_band_health_checks) do
  @doc = 'Defines all possible types for In Band Health Checks of Server object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Server Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 255 characters") if value.length > 255
    end
  end


  newproperty(:max_http_errors) do
    desc "Max HTTP Errors"
    defaultto 0
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_http_errors #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_http_errors #{value}, Must not be greater than 1024") if value > 1024
    end
  end


  newproperty(:max_other_failure) do
    desc "Max Other Failure"
    defaultto 10
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_other_failure #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_other_failure #{value}, Must not be greater than 1024") if value > 1024
    end
  end


  newproperty(:max_refused) do
    desc "Max Refused"
    defaultto 10
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_refused #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_refused #{value}, Must not be greater than 1024") if value > 1024
    end
  end


  newproperty(:max_timeout_failure) do
    desc "Max Timeout Failures"
    defaultto 10
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_timeout_failure #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_timeout_failure #{value}, Must not be greater than 1024") if value > 1024
    end
  end


end
