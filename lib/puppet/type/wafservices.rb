Puppet::Type.newtype(:wafservices) do
 @doc = 'Type representing a Service object on the Barracuda Web Application Firewall.'

ensurable

newparam(:name, :namevar => true) do
    desc 'Web Application Name'
    validate do |value|
      fail 'name should not be blank' if value == ''
    end
  end


  newproperty(:type) do
    desc 'Type'
    defaultto:HTTP
  end

  newproperty(:dps_enabled) do
    desc 'Enable DDoS Prevention Service'
    defaultto:No
  end

  newparam(:mask) do
    desc 'Mask'
  end

  newparam(:ip_address) do
    desc 'VIP'
    validate do |value|
      fail 'ip_address should not be blank' if value == ''
    end
  end

  newparam(:port) do
    desc 'Port'
  end

  newparam(:group) do
    desc 'Service Group'
  end

  newparam(:vsite) do
    desc 'Vsite'
  end

  newproperty(:status) do
    desc 'Status'
    defaultto:On
  end

  newproperty(:address_version) do
    desc 'Version'
    defaultto:IPv4
  end

  newparam(:comments) do
    desc 'Comments'
  end

  newparam(:app_id) do
    desc 'Service App Id'
  end

  newproperty(:certificate) do
    desc 'Certificate'
  end

  newproperty(:enable_access_logs) do
    desc 'Enable Access Logs'
    defaultto:Yes
  end

  newparam(:session_timeout) do
    desc 'Session Timeout'
  end

end
