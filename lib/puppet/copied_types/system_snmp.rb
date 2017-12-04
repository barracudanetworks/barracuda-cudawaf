Puppet::Type.newtype(:system_snmp) do
  @doc = 'Defines all possible types for Snmp of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:authentication_method, :array_matching => :all) do
    desc "Authentication Method"
    defaultto :MD5
    newvalues(:MD5, :SHA)
  end


  newproperty(:community_string, :array_matching => :all) do
    desc "Community String"
    defaultto :cudaSNMP
  end


  newproperty(:enable_snmp_agent, :array_matching => :all) do
    desc "Enable SNMP Agent"
    defaultto :Yes
  end


  newproperty(:encryption_method, :array_matching => :all) do
    desc "Encryption Method:"
    defaultto :DES
    newvalues(:DES, :AES)
  end


  newproperty(:encryption_password, :array_matching => :all) do
    desc "Password"
    defaultto :adminpassword
  end


  newproperty(:ip_address, :array_matching => :all) do
    desc "IP Address"
  end


  newproperty(:netmask) do
    desc "Netmask"
  end


  newproperty(:password, :array_matching => :all) do
    desc "SNMP password"
    defaultto :adminpassword
  end


  newproperty(:system_location, :array_matching => :all) do
    desc "System Location"
  end


  newproperty(:user, :array_matching => :all) do
    desc "User"
    defaultto :admin
  end


  newproperty(:version, :array_matching => :all) do
    desc "Version"
    defaultto :v2c
    newvalues(:v2c, :v3)
  end


end
