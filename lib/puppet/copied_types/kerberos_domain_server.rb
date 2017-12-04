Puppet::Type.newtype(:kerberos_domain_server) do
  @doc = 'Defines all possible types for Kerberos Domain Server object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:domain_alias) do
    desc "Domain Alias"
  end


  newproperty(:ip_address, :array_matching => :all) do
    desc "Server IP"
    validate do |value|
      fail("Invalid ip_address #{value}, Illegal characters present") unless value =~ /(^([a-zA-Z0-9.\-\_]+))$/
    end
  end


  newproperty(:kdc_name) do
    desc "KDC Realm Name"
  end


  newproperty(:port) do
    desc "Server Port"
    defaultto 88
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid port #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid port #{value}, Must not be greater than 65535") if value > 65535
    end
  end


end
