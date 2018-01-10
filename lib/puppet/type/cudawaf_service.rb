Puppet::Type.newtype(:cudawaf_service) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  apply_to_device
  ensurable

  newparam(:name, namevar: true) do
    desc 'Web Application Name'
    validate do |value|
      raise("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      raise("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end

  newproperty(:address_version) do
    desc 'Version'
    defaultto :IPv4
    newvalues(:IPv4, :IPv6, :ipv4, :ipv6)
  end

  newproperty(:status) do
    desc 'Status'
    defaultto :On
    newvalues(:On, :Off)
  end

  newproperty(:certificate) do
    desc 'Certificate'
  end

  newproperty(:comments) do
    desc 'Comments'
  end

  newproperty(:port) do
    desc 'Port'
    defaultto 80
    munge do |value|
      Integer(value)
    end
    validate do |value|
      raise("Invalid port #{value}, Must not be lesser than 1") if value < 1
      raise("Invalid port #{value}, Must not be greater than 65535") if value > 65_535
    end
  end

  newproperty(:enable_access_logs) do
    desc 'Enable Access Logs'
    defaultto :Yes
    newvalues(:Yes, :No)
  end

  newproperty(:session_timeout) do
    desc 'Session Timeout'
    defaultto 60
    munge do |value|
      Integer(value)
    end
    validate do |value|
      raise("Invalid session_timeout #{value}, Must not be lesser than 0") if value < 0
      raise("Invalid session_timeout #{value}, Must not be greater than 86400") if value > 86_400
    end
  end

  newproperty(:app_id) do
    desc 'Service App Id'
    validate do |value|
      raise("Invalid app_id #{value}, Illegal characters present") unless value =~ /^[[:alnum:]*\.\-\_]*$/
    end
  end

  newproperty(:group) do
    desc 'Service Group'
    validate do |value|
      raise("Invalid group #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      raise("Invalid group #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end

  newproperty(:type) do
    desc 'Type'
    defaultto :HTTP
    newvalues('HTTP', 'HTTPS', 'Instant SSL', 'Redirect', 'Custom', 'Custom SSL', 'FTP', 'FTP SSL',
              'http', 'https', 'instant ssl', 'redirect', 'custom', 'custom ssl', 'ftp', 'ftp ssl')
  end

  newproperty(:ip_address) do
    desc 'VIP'
  end

  newproperty(:vsite) do
    desc 'Vsite'
    validate do |value|
      raise("Invalid vsite #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      raise("Invalid vsite #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end

  newproperty(:mask) do
    desc 'Mask'
  end
end
