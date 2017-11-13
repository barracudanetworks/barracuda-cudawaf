Puppet::Type.newtype(:wafcloudcontrol) do
  @doc = 'Type representing a Cloud Control object on the Barracuda Web Application Firewall.'

ensurable
  newparam(:state, :namevar => true) do
    desc ''
    validate do |value|
      fail 'state should not be blank' if value == ''
    end
  end

  newproperty(:connect_mode) do
    desc 'connect_mode'
    defaultto:'cloud'
  end

  newproperty(:password) do
   desc 'password'
   defaultto:''
  end
 
  newproperty(:username) do
   desc 'username'
   defaultto:''
  end

  newproperty(:validation_token) do
   desc 'validation_token'
   defaultto:'validation_token'
  end

end
