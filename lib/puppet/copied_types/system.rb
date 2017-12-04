Puppet::Type.newtype(:system) do
  @doc = 'Defines all possible types for System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:device_name) do
    desc "Firewall Name"
    defaultto 'Web Application Firewall'
    validate do |value|
      fail("Invalid device_name #{value}, Illegal characters present") unless value =~ /^[A-Za-z0-9\s\.\-]+$/
    end
  end


  newproperty(:domain) do
    desc "Default Domain"
  end


  newproperty(:enable_ipv6) do
    desc ""
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:hostname) do
    desc "Default Hostname"
    defaultto :barracuda
    validate do |value|
      fail("Invalid hostname #{value}, Illegal characters present") unless value =~ /^[\w\-]+$/
      fail("Invalid hostname #{value}, Must be no longer than 512 characters") if value.length > 512
    end
  end


  newproperty(:interface_for_system_services) do
    desc "Interface for System Services"
    defaultto :WAN
    newvalues(:WAN, :Management)
  end


  newproperty(:locale) do
    desc ""
    defaultto :en_US
  end


  newproperty(:model) do
    desc ""
    defaultto :REF(get_model)
  end


  newproperty(:operation_mode) do
    desc ""
    defaultto :proxy
  end


  newproperty(:serial) do
    desc ""
    munge do |value|
      Integer(value)
    end
  end


  newproperty(:time_zone) do
    desc ""
  end


end
