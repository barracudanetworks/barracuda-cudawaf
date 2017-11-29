Puppet::Type.newtype(:service_slow_client_attack) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:data_transfer_rate) do
    desc "Data Transfer Rate in KB/Sec"
    defaultto 10
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid data_transfer_rate #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid data_transfer_rate #{value}, Must not be greater than 1024") if value > 1024
    end
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:incremental_request_timeout) do
    desc "Incremental Request Timeout"
    defaultto 30
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid incremental_request_timeout #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid incremental_request_timeout #{value}, Must not be greater than 600") if value > 600
    end
  end


  newproperty(:exception_clients) do
    desc "Exception Clients"
  end


  newproperty(:incremental_response_timeout) do
    desc "Incremental Response Timeout"
    defaultto 30
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid incremental_response_timeout #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid incremental_response_timeout #{value}, Must not be greater than 600") if value > 600
    end
  end


  newproperty(:max_request_timeout) do
    desc "Max Request Timeout"
    defaultto 600
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_request_timeout #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_request_timeout #{value}, Must not be greater than 3600") if value > 3600
    end
  end


  newproperty(:max_response_timeout) do
    desc "Max Response Timeout"
    defaultto 600
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_response_timeout #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_response_timeout #{value}, Must not be greater than 3600") if value > 3600
    end
  end


end
