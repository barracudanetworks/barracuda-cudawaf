Puppet::Type.newtype(:system_export_log_settings) do
  @doc = 'Defines all possible types for Export Log Settings of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:export_access_logs) do
    desc "Enable export of Access Logs"
    defaultto :Enable
    newvalues(:Enable, :Disable)
  end


  newproperty(:export_audit_logs) do
    desc "Enable export of Audit Logs"
    defaultto :Enable
    newvalues(:Enable, :Disable)
  end


  newproperty(:export_network_firewall_logs) do
    desc "Enable export of Network Firewall Logs"
    defaultto :Enable
    newvalues(:Enable, :Disable)
  end


  newproperty(:export_system_logs) do
    desc "Enable export of System Logs"
    defaultto :Enable
    newvalues(:Enable, :Disable)
  end


  newproperty(:export_web_firewall_logs) do
    desc "Enable export of Web Firewall Logs"
    defaultto :Enable
    newvalues(:Enable, :Disable)
  end


end
