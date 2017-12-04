Puppet::Type.newtype(:ldap_domain_server) do
  @doc = 'Defines all possible types for LDAP Domain Server object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:allow_nested_groups) do
    desc "Allow Nested Groups"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:base_dn) do
    desc "Base DN"
  end


  newproperty(:bind_dn) do
    desc "Bind DN (Username)"
  end


  newproperty(:bind_password) do
    desc "Bind Password"
  end


  newproperty(:domain_alias) do
    desc "Domain Alias"
    validate do |value|
      fail("Invalid domain_alias #{value}, Illegal characters present") unless value =~ /(^([a-zA-Z0-9.\-\_]+))$/
    end
  end


  newproperty(:group_filter) do
    desc "Group Filter"
    defaultto :(&(objectClass=group)(member=%user_dn))
  end


  newproperty(:group_name_attribute) do
    desc "Group Name Attribute"
    defaultto :sAMAccountName
  end


  newproperty(:ip_address, :array_matching => :all) do
    desc "Server IP"
    validate do |value|
      fail("Invalid ip_address #{value}, Illegal characters present") unless value =~ /(^([a-zA-Z0-9.\-\_]+))$/
    end
  end


  newproperty(:login_attribute) do
    desc "Login Attribute"
    defaultto :sAMAccountName
  end


  newproperty(:port) do
    desc "Server Port"
    defaultto 389
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid port #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid port #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:query_for_group) do
    desc "Query For Group"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:secure_connection_type) do
    desc "Secure Connection Type"
    defaultto :None
    newvalues(:None, :SSL/TLS, :StartTLS)
  end


end
