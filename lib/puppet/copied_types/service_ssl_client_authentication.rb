Puppet::Type.newtype(:service_ssl_client_authentication) do
  @doc = 'Defines all possible types for Ssl Client Authentication of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:client_authentication) do
    desc "Client Authentication"
    defaultto :Disable
    newvalues('Disable', 'For Service', 'For Selected Rule(s)')
  end


  newproperty(:client_certificate_for_rule, :array_matching => :all) do
    desc "Rule Group Name"
  end


  newproperty(:enforce_client_certificate) do
    desc "Enforce Client Certificate"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:trusted_certificates, :array_matching => :all) do
    desc "Trusted Certificates"
  end


end
