Puppet::Type.newtype(:cudawaf_cloudcontrol) do
  @doc = 'Type representing a Cloud Control object on the Barracuda Web Application Firewall.'

  apply_to_device
  ensurable

  newparam(:state, namevar: true) do
    desc 'Cloud Control Connection State'
    defaultto 'not_connected'
    newvalues('connected', 'not_connected')
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
    #defaultto :validation_token
  end
end
