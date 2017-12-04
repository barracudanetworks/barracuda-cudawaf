Puppet::Type.newtype(:service_basic_security) do
  @doc = 'Defines all possible types for Basic Security of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:client_ip_addr_header) do
    desc "Header for Client IP Address"
    validate do |value|
      fail("Invalid client_ip_addr_header #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid client_ip_addr_header #{value}, Must be no longer than 50 characters") if value.length > 50
      fail("Invalid client_ip_addr_header #{value}, Must be no shorter than 1 characters") if value.length < 1
    end
  end


  newproperty(:ignore_case) do
    desc "Ignore case"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:mode) do
    desc "Mode"
    defaultto :Passive
    newvalues(:Passive, :Active)
  end


  newproperty(:rate_control_pool) do
    desc "Rate Control Pool"
    defaultto :NONE
  end


  newproperty(:rate_control_status) do
    desc "Rate Control Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:trusted_hosts_action) do
    desc "Trusted Hosts Action"
    defaultto :Default
    newvalues(:Allow, :Passive, :Default)
  end


  newproperty(:trusted_hosts_group) do
    desc "Trusted Hosts Group"
  end


  newproperty(:web_firewall_log_level) do
    desc "Web Firewall Log Level"
    defaultto :5-Notice
    newvalues(:0-Emergency, :1-Alert, :2-Critical, :3-Error, :4-Warning, :5-Notice, :6-Information, :7-Debug)
    validate do |value|
      fail("Invalid web_firewall_log_level #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid web_firewall_log_level #{value}, Must not be greater than 7") if value > 7
    end
  end


  newproperty(:web_firewall_policy) do
    desc "Web Firewall Policy"
    defaultto :default
  end


end
