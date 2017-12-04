Puppet::Type.newtype(:uploaded_certificate) do
  @doc = 'Defines all possible types for Uploaded Certificate object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Certificate Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


  newproperty(:allow_private_key_export) do
    desc ""
    defaultto :1
  end


  newproperty(:key_type) do
    desc "Select Key Type:"
    defaultto :rsa
  end


end
