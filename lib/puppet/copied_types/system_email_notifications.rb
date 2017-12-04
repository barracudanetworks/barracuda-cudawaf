Puppet::Type.newtype(:system_email_notifications) do
  @doc = 'Defines all possible types for Email Notifications of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:alerts_email_id) do
    desc "System Alerts Email Address"
  end


  newproperty(:contact_email_id) do
    desc "System Contact Email Address:"
  end


  newproperty(:from_email) do
    desc "From Address"
  end


  newproperty(:smtp_password) do
    desc "Password"
  end


  newproperty(:smtp_port) do
    desc "SMTP Port"
    defaultto 25
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid smtp_port #{value}, Illegal characters present") unless value =~ /^(([1-9](\d){0,3})|((6553)[0-5])|((655)[0-2](\d))|((65)[0-4]\d{2})|((6)[0-4]\d{3})|([1-5]\d{4}))?$/
    end
  end


  newproperty(:smtp_server) do
    desc "SMTP Server"
  end


  newproperty(:smtp_username) do
    desc "Username"
  end


end
