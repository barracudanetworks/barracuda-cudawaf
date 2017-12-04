Puppet::Type.newtype(:service_ssl_ocsp) do
  @doc = 'Defines all possible types for Ssl Ocsp of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:certificate) do
    desc "OCSP Issuer Cetificate"
  end


  newproperty(:enable) do
    desc "Enabled"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:responder_url) do
    desc "OCSP Responder URL"
  end


end
