Puppet::Type.newtype(:user) do
  @doc = 'Defines all possible types for User object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:email_address) do
    desc "Email Address"
  end


  newproperty(:password) do
    desc "Password"
  end


  newproperty(:re_enter_password) do
    desc "Re-enter Password"
  end


  newproperty(:role) do
    desc "Role"
  end


end
