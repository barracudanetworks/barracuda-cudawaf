Puppet::Type.newtype(:system_account_lockout_settings) do
  @doc = 'Defines all possible types for Account Lockout Settings of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:failed_login_time_threshold) do
    desc "Failed Login Time Threshold (in minutes)"
    defaultto 15
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid failed_login_time_threshold #{value}, Must not be lesser than 1") if value < 1
    end
  end


  newproperty(:lockout_duration) do
    desc "Lock User Account for (in minutes)"
    defaultto 15
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid lockout_duration #{value}, Must not be lesser than 1") if value < 1
    end
  end


  newproperty(:maximum_failed_login_attempts) do
    desc "Maximum Failed Login Attempts"
    defaultto 5
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid maximum_failed_login_attempts #{value}, Must not be lesser than 1") if value < 1
    end
  end


end
