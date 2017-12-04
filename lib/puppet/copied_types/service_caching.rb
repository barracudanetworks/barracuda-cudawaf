Puppet::Type.newtype(:service_caching) do
  @doc = 'Defines all possible types for Caching of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:cache_negative_response) do
    desc "Cache Negative Responses"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:expiry_age) do
    desc "Expiry Age (minutes)"
    defaultto 60
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid expiry_age #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid expiry_age #{value}, Must not be greater than 525600") if value > 525600
    end
  end


  newproperty(:file_extensions, :array_matching => :all) do
    desc "File Extensions"
    validate do |value|
      fail("Invalid file_extensions #{value}, Illegal characters present") unless value =~ /((^[*])|(^[^\.\*\<\& ]+))$/
    end
  end


  newproperty(:ignore_request_headers) do
    desc "Ignore Request Headers"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:ignore_response_headers) do
    desc "Ignore Response Headers"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:max_size) do
    desc "Max Size (KB)"
    defaultto 256
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_size #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_size #{value}, Must not be greater than 6656") if value > 6656
    end
  end


  newproperty(:min_size) do
    desc "Min Size (B)"
    defaultto 256
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid min_size #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid min_size #{value}, Must not be greater than 6815744") if value > 6815744
    end
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


end
