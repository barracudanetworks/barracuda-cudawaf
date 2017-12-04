Puppet::Type.newtype(:module_log_level) do
  @doc = 'Defines all possible types for Module Log Level object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:comments) do
    desc "Comment"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$'/
    end
  end


  newproperty(:log_level) do
    desc "Log Level"
    newvalues(:0-Emergency, :1-Alert, :2-Critical, :3-Error, :4-Warning, :5-Notice, :6-Information, :7-Debug)
  end


  newproperty(:module) do
    desc "Module"
    newvalues('AAA', 'Adaptive Profiling', 'Cache', 'Compression', 'Cookie', 'Connection Pool', 'Crypto', 'DNS', 'Failover', 'FTP Service', 'HTTP Service', 'TPS', 'Kernel Module', 'Load Balancer', 'Memory', 'Rewrite', 'Response Page', 'Service', 'Share Secret Key', 'SSL', 'STM', 'Web Log', 'Web Address Translation', 'Web Firewall')
  end


end
