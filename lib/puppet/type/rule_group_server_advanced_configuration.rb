Puppet::Type.newtype(:rule_group_server_advanced_configuration) do
  @doc = 'Defines all possible types for Advanced Configuration of Rule Group Server object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Server Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 255 characters") if value.length > 255
    end
  end


  newparam(:rule_group_name, :namevar => true) do
    desc "Rule Group Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newparam(:service_name, :namevar => true) do
    desc 'Service Name'
    validate do |value|
      fail("Invalid service_name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:client_impersonation) do
    desc "Client Impersonation"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:max_connections) do
    desc "Max Connections"
    defaultto 10000
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_connections #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_connections #{value}, Must not be greater than 500000") if value > 500000
    end
  end


  newproperty(:max_establishing_connections) do
    desc "Max Establishing Connections"
    defaultto 100
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_establishing_connections #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_establishing_connections #{value}, Must not be greater than 3096") if value > 3096
    end
  end


  newproperty(:max_keepalive_requests) do
    desc "Max Keepalive Requests"
    defaultto 0
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_keepalive_requests #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_keepalive_requests #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:max_requests) do
    desc "Max Requests"
    defaultto 1000
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_requests #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_requests #{value}, Must not be greater than 3096") if value > 3096
    end
  end


  newproperty(:max_spare_connections) do
    desc "Max Spare Connections"
    defaultto 0
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_spare_connections #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_spare_connections #{value}, Must not be greater than 3096") if value > 3096
    end
  end


  newproperty(:source_ip_to_connect) do
    desc "Source IP to Connect"
  end


  newproperty(:timeout) do
    desc "Timeout"
    defaultto 300000
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid timeout #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid timeout #{value}, Must not be greater than 86400000") if value > 86400000
    end
  end


  def self.title_patterns
     [ [ /(.*)/m, [ [:name] ] ] ]
  end


end
