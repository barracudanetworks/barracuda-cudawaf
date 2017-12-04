Puppet::Type.newtype(:rule_group_server_out_of_band_health_checks) do
  @doc = 'Defines all possible types for Out Of Band Health Checks of Rule Group Server object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Server Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 255 characters") if value.length > 255
    end
  end


  newproperty(:enable_OOB_health_checks) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:interval) do
    desc "Interval"
    defaultto 10
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid interval #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid interval #{value}, Must not be greater than 10000") if value > 10000
    end
  end


end
