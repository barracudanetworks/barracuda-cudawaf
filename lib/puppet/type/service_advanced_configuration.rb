Puppet::Type.newtype(:service_advanced_configuration) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end

  newproperty(:enable_vdi) do
    desc "Enable VDI"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_web_application_firewall) do
    desc "Enable Web Application Firewall"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:enable_websocket) do
    desc "Enable WebSocket"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:ddos_exception_list) do
    desc "DDoS Exception List"
  end


  newproperty(:keepalive_requests) do
    desc "Keepalive Requests"
    defaultto 64
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid keepalive_requests #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid keepalive_requests #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:ntlm_ignore_extra_data) do
    desc "NTLM Ignore Extra Data"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:accept_list_status) do
    desc ""
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_http2) do
    desc "Enable HTTP2"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_proxy_protocol) do
    desc "Enable Proxy Protocol"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:proxy_list_status) do
    desc ""
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:accept_list) do
    desc ""
  end


  newproperty(:proxy_list) do
    desc ""
  end


end
