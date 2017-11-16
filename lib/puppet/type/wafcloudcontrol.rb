Puppet::Type.newtype(:wafcloudcontrol) do
  @doc = 'Type representing a Cloud Control object on the Barracuda Web Application Firewall.'

  ensurable


  newparam(:state, :namevar => true) do
    desc 'Cloud Control Connection State'
    defaultto 'not-connected'
    newvalues('connected', 'not-connected')
  end

  newproperty(:connect_mode) do
    desc 'Connected Using'
    defaultto :cloud
    newvalues(:cloud, :local)
  end

  newproperty(:password) do
   desc 'Password'
  end
 
  newproperty(:username) do
   desc 'Username'
  end

  newproperty(:validation_token) do
   desc 'validation_token'
   defaultto:'validation_token'
  end

end
