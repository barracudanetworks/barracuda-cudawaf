Puppet::Type.newtype(:service_ip_reputation) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:tor_nodes) do
    desc "TOR Nodes"
    defaultto :Allow
    newvalues(:Block, :Allow)
  end


  newproperty(:geoip_enable_logging) do
    desc "Enable Logging"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:satellite_provider) do
    desc "Satellite Provider"
    defaultto :Allow
    newvalues(:Block, :Allow)
  end


  newproperty(:geoip_action) do
    desc "Action"
    defaultto :Block
    newvalues(:Block, :Allow)
  end


  newproperty(:apply_policy_at) do
    desc "Apply Policy at"
    defaultto 'Network Layer'
    newvalues('Network Layer', 'Application Layer')
  end


  newproperty(:anonymous_proxy) do
    desc "Anonymous Proxy"
    defaultto :Allow
    newvalues(:Block, :Allow)
  end


  newproperty(:enable_ip_reputation_filter) do
    desc "Enable IP Reputation Filter"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:geo_pool) do
    desc "Geo Pool"
  end


  newproperty(:barracuda_reputation_blocklist) do
    desc "Barracuda Reputation Blocklist"
    defaultto :Allow
    newvalues(:Block, :Allow)
  end


end
