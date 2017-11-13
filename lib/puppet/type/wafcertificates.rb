Puppet::Type.newtype(:wafcertificates) do
 @doc = 'Type representing a Certificate  object on the Barracuda Web Application Firewall.'

ensurable
newparam(:name, :namevar => true) do
    desc 'WAF Certificate Name'
    validate do |value|
      fail 'name should not be blank' if value == ''
    end
  end

  newproperty(:allow_private_key_export) do
    desc 'allow_private_key_export'
    defaultto:yes
  end
  
   newparam(:cer_name) do
   desc:'certificate name'
   end

  
  newproperty(:city) do
    desc 'city'
    defaultto:'city'
  end

  newproperty(:common_name) do
    desc 'common_name'
    defaultto:'common_name'
  end
  
  newproperty(:country_code) do
    desc 'country_code'
    defaultto:'country_code'
  end

  newproperty(:curve_type) do
    desc 'curve_type'
    defaultto:'secp256r1'
  end

  newproperty(:key_size) do
    desc 'key_size'
    defaultto:'key_size'
  end

  newproperty(:key_type) do
    desc 'key_type'
    defaultto:'key_type'
  end

  newproperty(:organization_name) do
    desc 'organization_name'
    defaultto:'organization_name'
  end

  newproperty(:organization_unit) do
    desc 'organization_unit'
    defaultto:'organization_unit'
  end

  newproperty(:state) do
    desc 'state'
    defaultto:'state'
  end

  newparam(:type) do
    desc 'type'
  end

  newproperty(:signed_certificate) do
    desc 'signed_certificate'
    defaultto:'signed_certificate'
  end

  newproperty(:assign_associated_key) do
    desc 'assign_associated_key'
    defaultto:'no'
  end

  newproperty(:key) do
    desc 'key'
    defaultto:'key'
  end

  newproperty(:intermediary_certificate) do
    desc 'intermediary_certificate'
  end

  newproperty(:password) do
    desc 'password'
    defaultto:'password'
  end
  
  newproperty(:upload) do
    desc 'upload'
    defaultto:'signed'
  end
 
  newproperty(:trusted_certificate) do
    desc 'trusted_certificate'
    defaultto:'trusted_certificate'
  end

  newproperty(:trusted_server_certificate) do
    desc 'trusted_server_certificate'
    defaultto:'trusted_server_certificate'
  end

end

