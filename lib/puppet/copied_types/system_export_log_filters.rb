Puppet::Type.newtype(:system_export_log_filters) do
  @doc = 'Defines all possible types for Export Log Filters of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:system_log_severity) do
    desc "System Log Severity"
    defaultto :5-Notice
    newvalues(:0-Emergency, :1-Alert, :2-Critical, :3-Error, :4-Warning, :5-Notice, :6-Information, :7-Debug)
  end


  newproperty(:web_firewall_log_severity) do
    desc "Web Firewall Log Severity"
    defaultto :1-Alert
    newvalues(:0-Emergency, :1-Alert, :2-Critical, :3-Error, :4-Warning, :5-Notice, :6-Information, :7-Debug)
  end


end
