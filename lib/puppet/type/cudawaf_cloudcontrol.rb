Puppet::Type.newtype(:cudawaf_cloudcontrol) do
  @doc = 'Type representing a Cloud Control object on the Barracuda Web Application Firewall.'

  apply_to_device
  ensurable

  newparam(:state, namevar: true) do
    desc 'Cloud Control Connection State'
    defaultto :not_connected
    newvalues(:connected, :not_connected)
  end

  newproperty(:connect_mode) do
    desc 'Connected Using'
    defaultto :cloud
    newvalues(:cloud, :local)
  end

  newproperty(:password) do
    desc 'Password'
    validate do |value|
      raise("Invalid password #{value}, must be between 8 and 20 characters") unless value =~ /^.{8,20}$/i
    end
  end

  newproperty(:username) do
    desc 'Username'
    validate do |value|
      raise("Invalid username #{value}, Illegal characters present") unless value =~ /^\A([\w+\-_].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z$/i
    end
  end

  newproperty(:validation_token) do
    desc 'validation_token'
  end
end
