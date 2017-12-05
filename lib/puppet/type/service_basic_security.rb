Puppet::Type.newtype(:service_basic_security) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:mode) do
    desc "Mode"
    defaultto :Passive
    newvalues(:Passive, :Active)
  end


  newproperty(:ignore_case) do
    desc "Ignore case"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:web_firewall_policy) do
    desc "Web Firewall Policy"
    defaultto :default
  end


  newproperty(:rate_control_status) do
    desc "Rate Control Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:rate_control_pool) do
    desc "Rate Control Pool"
    defaultto :NONE
  end


  newproperty(:web_firewall_log_level) do
    desc "Web Firewall Log Level"
    defaultto "5-Notice"
    newvalues("0-Emergency", "1-Alert", "2-Critical", "3-Error", "4-Warning", "5-Notice", "6-Information", "7-Debug")
  end


  newproperty(:trusted_hosts_group) do
    desc "Trusted Hosts Group"
  end


  newproperty(:client_ip_addr_header) do
    desc "Header for Client IP Address"
    validate do |value|
      fail("Invalid client_ip_addr_header #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid client_ip_addr_header #{value}, Must be no longer than 50 characters") if value.length > 50
      fail("Invalid client_ip_addr_header #{value}, Must be no shorter than 1 characters") if value.length < 1
    end
  end


  newproperty(:trusted_hosts_action) do
    desc "Trusted Hosts Action"
    defaultto :Default
    newvalues(:Allow, :Passive, :Default)
  end


end
