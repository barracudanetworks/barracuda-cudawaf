Puppet::Type.newtype(:rule_group) do
  @doc = 'Defines all possible types for Rule Group object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
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


  newproperty(:access_log) do
    desc "Access Log"
    defaultto :Enable
    newvalues(:Enable, :Disable)
  end


  newproperty(:app_id) do
    desc "Rule App Id"
    validate do |value|
      fail("Invalid app_id #{value}, Illegal characters present") unless value =~ /^[[:alnum:]*\.\-\_]*$/
    end
  end


  newproperty(:comments) do
    desc "Comments"
  end


  newproperty(:cookie_age) do
    desc "Cookie Age"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid cookie_age #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid cookie_age #{value}, Must not be greater than 1051200") if value > 1051200
    end
  end


  newproperty(:extended_match) do
    desc "Extended Match"
    defaultto :*
  end


  newproperty(:extended_match_sequence) do
    desc "Extended Match Sequence"
    defaultto 1000
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid extended_match_sequence #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid extended_match_sequence #{value}, Must not be greater than 1000") if value > 1000
    end
  end


  newproperty(:failover_method) do
    desc "Failover Method"
    defaultto 'Load Balance'
    newvalues('Load Balance', 'Error')
  end


  newproperty(:header_name) do
    desc "Header Name"
  end


  newproperty(:host_match) do
    desc "Host Match"
    validate do |value|
      fail("Invalid host_match #{value}, Illegal characters present") unless value =~ /^[[:alnum:]*\.\-\_]*$/
    end
  end


  newproperty(:lb_algorithm) do
    desc "Algorithm"
    defaultto 'Round Robin'
    newvalues('Round Robin', 'Weighted Round Robin', 'Least Requests')
  end


  newproperty(:mode) do
    desc "Mode"
    defaultto :Passive
    newvalues(:Passive, :Active)
  end


  newproperty(:parameter_name) do
    desc "Parameter Name"
  end


  newproperty(:persistence_cookie_domain) do
    desc "Persistence Cookie Domain"
  end


  newproperty(:persistence_cookie_name) do
    desc "Persistence Cookie Name"
    defaultto :persistence
  end


  newproperty(:persistence_cookie_path) do
    desc "Persistence Cookie Path"
  end


  newproperty(:persistence_idle_timeout) do
    desc "Idle Timeout"
    defaultto 600
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid persistence_idle_timeout #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid persistence_idle_timeout #{value}, Must not be greater than 1800") if value > 1800
    end
  end


  newproperty(:persistence_method) do
    desc "Persistence Method"
    defaultto :None
    newvalues('None', 'Source IP', 'Cookie Insert', 'Cookie Passive', 'HTTP Header', 'URL Parameter')
  end


  newproperty(:source_ip_netmask) do
    desc "Source IP"
  end


  newproperty(:status) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:url_match) do
    desc "URL Match"
    validate do |value|
      fail("Invalid url_match #{value}, Illegal characters present") unless value =~ /(^\/([^*?<>&\s])*$)|(^\/[^*?<>&\s]*[*][^*?<>&\s]*$)/
    end
  end


  newproperty(:web_firewall_policy) do
    desc "Web Firewall Policy"
  end


  def self.title_patterns
     [ [ /(.*)/m, [ [:name] ] ] ]
  end


end
