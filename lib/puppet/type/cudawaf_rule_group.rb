Puppet::Type.newtype(:cudawaf_rule_group) do
  @doc = 'Defines all possible types for Rule Group object on the Barracuda Web Application Firewall.'

  apply_to_device
  ensurable

  newparam(:name, namevar: true) do
    desc 'Rule Group Name'
    validate do |value|
      raise("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      raise("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end

  newparam(:service_name, namevar: true) do
    desc 'Service Name'
    validate do |value|
      raise("Invalid service_name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      raise("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end

  newproperty(:app_id) do
    desc 'Rule App Id'
    validate do |value|
      raise("Invalid app_id #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
    end
  end

  newproperty(:comments) do
    desc 'Comments'
  end

  newproperty(:extended_match) do
    desc 'Extended Match'
    defaultto :*
  end

  newproperty(:extended_match_sequence) do
    desc 'Extended Match Sequence'
    defaultto 1000
    munge do |value|
      Integer(value)
    end
    validate do |value|
      raise("Invalid extended_match_sequence #{value}, Must not be lesser than 0") if value < 0
      raise("Invalid extended_match_sequence #{value}, Must not be greater than 1000") if value > 1000
    end
  end

  newproperty(:host_match) do
    desc 'Host Match'
    validate do |value|
      raise("Invalid host_match #{value}, Illegal characters present") unless value =~ /^[[:alnum:]*\.\-\_]*$/
    end
  end

  newproperty(:mode) do
    desc 'Mode'
    defaultto :Passive
    newvalues(:Passive, :Active)
  end

  newproperty(:status) do
    desc 'Status'
    defaultto :On
    newvalues(:On, :Off)
  end

  newproperty(:url_match) do
    desc 'URL Match'
    validate do |value|
      raise("Invalid url_match #{value}, Illegal characters present") unless value =~ /(^\/([^*?<>&\s])*$)|(^\/[^*?<>&\s]*[*][^*?<>&\s]*$)/
    end
  end

  newproperty(:web_firewall_policy) do
    desc 'Web Firewall Policy'
  end

  def self.title_patterns
    [[/(.*)/m, [[:name]]]]
  end
end
