Puppet::Type.newtype(:cudawaf_rule_group_server) do
  @doc = 'Defines all possible types for Rule Group Server object on the Barracuda Web Application Firewall.'

  apply_to_device
  ensurable

  newparam(:name, namevar: true) do
    desc 'Web Server Name'
    validate do |value|
      raise("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      raise("Invalid name #{value}, Must be no longer than 255 characters") if value.length > 255
    end
  end

  newparam(:service_name, namevar: true) do
    desc 'Service Name'
    validate do |value|
      raise("Invalid service_name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      raise("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end

  newparam(:rule_group_name, namevar: true) do
    desc 'Rule Group Name'
    validate do |value|
      raise("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      raise("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end

  newproperty(:address_version) do
    desc 'Version'
    defaultto :IPv4
    newvalues(:IPv4, :IPv6)
  end

  newproperty(:backup_server) do
    desc 'Backup Appliance'
    defaultto :No
    newvalues(:Yes, :No)
  end

  newproperty(:comments) do
    desc 'Comments'
  end

  newproperty(:hostname) do
    desc 'Hostname'
    validate do |value|
      raise("Invalid hostname #{value}, Illegal characters present") unless value =~ /(^([a-zA-Z0-9.\-\_]+))$/
    end
  end

  newproperty(:identifier) do
    desc 'Identifier:'
    defaultto 'IP Address'
    newvalues('IP Address', 'Hostname')
  end

  newproperty(:ip_address) do
    desc 'IP Address'
  end

  newproperty(:port) do
    desc 'Port'
    defaultto 80
    munge do |value|
      Integer(value)
    end
    validate do |value|
      raise("Invalid port #{value}, Must not be lesser than 0") if value < 0
      raise("Invalid port #{value}, Must not be greater than 65535") if value > 65_535
    end
  end

  newproperty(:status) do
    desc 'Status'
    defaultto 'In Service'
    newvalues('In Service', 'Out of Service Maintenance', 'Out of Service Sticky', 'Out of Service All')
  end

  newproperty(:weight) do
    desc 'WRR Weight'
    defaultto 1
    munge do |value|
      Integer(value)
    end
    validate do |value|
      raise("Invalid weight #{value}, Must not be lesser than 0") if value < 0
      raise("Invalid weight #{value}, Must not be greater than 65535") if value > 65_535
    end
  end

  def self.title_patterns
    [[/(.*)/m, [[:name]]]]
  end
end
