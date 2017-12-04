Puppet::Type.newtype(:service_load_balancing) do
  @doc = 'Defines all possible types for Load Balancing of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:algorithm) do
    desc "Algorithm"
    defaultto 'Round Robin'
    newvalues('Round Robin', 'Weighted Round Robin', 'Least Requests')
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


  newproperty(:failover_method) do
    desc "Failover Method"
    defaultto 'Load Balance'
    newvalues('Load Balance', 'Error')
  end


  newproperty(:header_name) do
    desc "Header Name"
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
    defaultto :/
  end


  newproperty(:persistence_idle_timeout) do
    desc "Idle Timeout"
    defaultto 600
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid persistence_idle_timeout #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid persistence_idle_timeout #{value}, Must not be greater than 86400") if value > 86400
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


end
