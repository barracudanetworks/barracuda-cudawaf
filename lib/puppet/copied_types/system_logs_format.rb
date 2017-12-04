Puppet::Type.newtype(:system_logs_format) do
  @doc = 'Defines all possible types for Logs Format of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:access_logs_custom_format) do
    desc "Access Logs Custom Format"
    defaultto '%t %un %lt %ai %ap %ci %cp %id %cu %m %p %h %v %s %bs %br %ch %tt %si %sp %st %sid %rtf %pmf %pf %wmf %u %q %r %c %ua %px %pp %au %cs1 %cs2 %cs3 %uid'
  end


  newproperty(:access_logs_standard_format) do
    desc "Access Logs Format"
    defaultto :Default
    newvalues('Standard Formats', 'Customized Formats')
  end


  newproperty(:arcsight_syslog_header) do
    desc "Syslog Header"
  end


  newproperty(:audit_logs_custom_format) do
    desc "Audit Logs Custom Format"
    defaultto '%t %un %lt %an %ct %li %lp %trt %tri %cn %cht %ot %on %var %ov %nv %add'
  end


  newproperty(:audit_logs_standard_format) do
    desc "Audit Logs Format"
    defaultto :Default
    newvalues('', 'Customized Formats')
  end


  newproperty(:logs_custom_format) do
    desc "Logs Custom Format"
    defaultto '%h %id %u %t %r %s %br'
  end


  newproperty(:network_logs_custom_format) do
    desc "Audit Logs Custom Format"
    defaultto '%t %un %lt %sl %p %srci %srcp %di %dp %act %acl %dsc'
  end


  newproperty(:network_logs_standard_format) do
    desc "Network Firewall Logs Format"
    defaultto :Default
    newvalues('', 'Customized Formats')
  end


  newproperty(:standard_log_formats) do
    desc "Logs Format"
    defaultto 'Common Log Format'
    newvalues('Standard Formats', 'Customized Formats')
  end


  newproperty(:syslog_headers) do
    desc "Syslog Header"
    defaultto 'Custom Header'
    newvalues('Custom Header', 'ArcSight Log Header', 'QRadar Log Header')
  end


  newproperty(:system_logs_custom_format) do
    desc "System Logs Custom Format"
    defaultto '%t %un %lt %md %ll %ei %ms'
  end


  newproperty(:system_logs_standard_format) do
    desc "System Logs Format"
    defaultto :Default
    newvalues('', 'Customized Formats')
  end


  newproperty(:web_firewall_logs_custom_format) do
    desc "WF Logs Custom Format"
    defaultto '%t %un %lt %sl %ad %ci %cp %ai %ap %ri %rt %at %fa %adl %m %u %p %sid %ua %px %pp %au %r %uid'
  end


  newproperty(:web_firewall_logs_standard_format) do
    desc "Web Firewall Logs Format"
    defaultto :Default
    newvalues('', 'Customized Formats')
  end


end
