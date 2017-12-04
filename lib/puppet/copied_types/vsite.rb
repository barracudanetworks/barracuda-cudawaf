Puppet::Type.newtype(:vsite) do
  @doc = 'Defines all possible types for Vsite object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Vsite"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:active_on) do
    desc "Active-on"
    defaultto :REF(get_serial)
  end


  newproperty(:comments) do
    desc "Comments"
  end


end
