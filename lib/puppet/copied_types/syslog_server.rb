Puppet::Type.newtype(:syslog_server) do
  @doc = 'Defines all possible types for Syslog Server object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:client_certificate) do
    desc "Client Certificate"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:comments) do
    desc "Comment"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:connection_type) do
    desc "Connection Type"
    defaultto :UDP
    newvalues(:UDP, :TCP, :SSL)
  end


  newproperty(:ip_address) do
    desc "IP Address"
  end


  newproperty(:port) do
    desc "Port"
    defaultto 514
    munge do |value|
      Integer(value)
    end
  end


  newproperty(:server_type) do
    desc "Server Type"
    defaultto 'Syslog NG'
    newvalues('Syslog NG', 'AMQP', 'AMQPS', 'Azure Event Hub')
  end


  newproperty(:timestamp_and_hostname) do
    desc "Log Timestamp and Hostname"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:validate_server_certificate) do
    desc "Validate Server Certificate"
    defaultto :No
    newvalues(:Yes, :No)
  end


end
