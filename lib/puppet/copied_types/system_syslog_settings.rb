Puppet::Type.newtype(:system_syslog_settings) do
  @doc = 'Defines all possible types for Syslog Settings of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:access_log_facility) do
    desc "Access Logs Facility"
    defaultto :local0
    newvalues(:local0, :local1, :local2, :local3, :local4, :local5, :local6, :local7)
  end


  newproperty(:audit_log_facility) do
    desc "Audit Logs Facility"
    defaultto :local0
    newvalues(:local0, :local1, :local2, :local3, :local4, :local5, :local6, :local7)
  end


  newproperty(:network_firewall_log_facility) do
    desc "Network Firewall Logs Facility"
    defaultto :local0
    newvalues(:local0, :local1, :local2, :local3, :local4, :local5, :local6, :local7)
  end


  newproperty(:syslog_facility) do
    desc "System Logs Facility"
    defaultto :local0
    newvalues(:local0, :local1, :local2, :local3, :local4, :local5, :local6, :local7)
  end


  newproperty(:web_firewall_log_facility) do
    desc "Web Firewall Logs Facility"
    defaultto :local0
    newvalues(:local0, :local1, :local2, :local3, :local4, :local5, :local6, :local7)
  end


end
