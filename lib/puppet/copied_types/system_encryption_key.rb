Puppet::Type.newtype(:system_encryption_key) do
  @doc = 'Defines all possible types for Encryption Key of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:cookie_encryption_key) do
    desc "Cookie Encryption Key"
  end


  newproperty(:key_expiry) do
    desc "Cookie Encryption Key Expiry"
    validate do |value|
      fail("Invalid key_expiry #{value}, Illegal characters present") unless value =~ /^(19[0-9]{2}|[2-9][0-9]{3})-((0(1|3|5|7|8)|10|12)-(0[1-9]|1[0-9]|2[0-9]|3[0-1])|(0(4|6|9)|11)-(0[1-9]|1[0-9]|2[0-9]|30)|(02)-(0[1-9]|1[0-9]|2[0-9]))\x20(0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9]){2}$/
    end
  end


  newproperty(:key_expiry_timezone) do
    desc "Key Expiry Time Zone"
    defaultto :Local
    newvalues(:Local, :GMT)
  end


end
