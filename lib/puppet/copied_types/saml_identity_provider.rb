Puppet::Type.newtype(:saml_identity_provider) do
  @doc = 'Defines all possible types for SAML Identity Provider object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Server IP"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


  newproperty(:metadata_file) do
    desc "Metadata File Upload"
  end


  newproperty(:metadata_type) do
    desc "Identity Provider Metadata Type"
    defaultto :URL
    newvalues('URL', 'File Upload')
  end


  newproperty(:metadata_url) do
    desc "Server IP"
  end


end
