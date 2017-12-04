Puppet::Type.newtype(:service_clickjacking) do
  @doc = 'Defines all possible types for Clickjacking of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allowed_origin) do
    desc "Allowed Origin URI"
  end


  newproperty(:options) do
    desc "Render Page Inside Iframe"
    defaultto 'Same Origin'
    newvalues('Never', 'Same Origin', 'Allowed Origin')
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


end
