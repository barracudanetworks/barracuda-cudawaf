Puppet::Type.newtype(:system_web_interface) do
  @doc = 'Defines all possible types for Web Interface of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:http_port) do
    desc "Web Interface Settings"
    defaultto :8000
  end


  newproperty(:http_session_length) do
    desc "Session Expiration Length"
    defaultto 20
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid http_session_length #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid http_session_length #{value}, Must not be greater than 9999999999999") if value > 9999999999999
    end
  end


end
