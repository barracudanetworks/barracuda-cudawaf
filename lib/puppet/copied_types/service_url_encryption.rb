Puppet::Type.newtype(:service_url_encryption) do
  @doc = 'Defines all possible types for Url Encryption of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:status) do
    desc "URL Encryption"
    defaultto :Off
    newvalues(:On, :Off)
  end


end
