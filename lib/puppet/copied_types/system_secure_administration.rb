Puppet::Type.newtype(:system_secure_administration) do
  @doc = 'Defines all possible types for Secure Administration of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:city) do
    desc "Locality Name"
    validate do |value|
      fail("Invalid city #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\s@\/\*-]*$/
    end
  end


  newproperty(:common_name) do
    desc "Common Name"
    validate do |value|
      fail("Invalid common_name #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\s@\/\*-]*$/
    end
  end


  newproperty(:country) do
    desc "Country"
    validate do |value|
      fail("Invalid country #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\s@\/\*-]*$/
      fail("Invalid country #{value}, Must be no longer than 2 characters") if value.length > 2
      fail("Invalid country #{value}, Must be no shorter than 2 characters") if value.length < 2
    end
  end


  newproperty(:https_access_only) do
    desc "Disable regular HTTP access, only allowing access to web interface via SSL."
    defaultto :No
  end


  newproperty(:https_port) do
    desc ""
    defaultto :443
  end


  newproperty(:key_size) do
    desc "Key Size"
    defaultto :1024
    newvalues(:512, :1024, :2048, :4096)
  end


  newproperty(:organization) do
    desc "Organization Name"
    validate do |value|
      fail("Invalid organization #{value}, Illegal characters present") unless value =~ /^[[:alnum:].,_&\'()-\s@\/\*]*$/
    end
  end


  newproperty(:organization_unit) do
    desc "Organizational Unit Name"
    validate do |value|
      fail("Invalid organization_unit #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\'\s@\/\*-]*$/
    end
  end


  newproperty(:state) do
    desc "State or Province"
    validate do |value|
      fail("Invalid state #{value}, Illegal characters present") unless value =~ /^[[:alnum:]._\s@\/\*-]*$/
    end
  end


end
