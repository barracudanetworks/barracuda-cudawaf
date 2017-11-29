Puppet::Type.newtype(:service_ssl_client_authentication) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:trusted_certificates) do
    desc "Trusted Certificates"
  end


  newproperty(:enforce_client_certificate) do
    desc "Enforce Client Certificate"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:client_authentication) do
    desc "Client Authentication"
    defaultto :Disable
    newvalues('Disable', 'For Service', 'For Selected Rule(s)')
  end


  newproperty(:client_certificate_for_rule) do
    desc "Rule Group Name"
  end


end
