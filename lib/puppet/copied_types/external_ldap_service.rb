Puppet::Type.newtype(:external_ldap_service) do
  @doc = 'Defines all possible types for External LDAP Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Realm Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


  newproperty(:bind_dn) do
    desc "Bind DN"
  end


  newproperty(:bind_password) do
    desc "Bind Password"
  end


  newproperty(:default_role) do
    desc "Default Role"
  end


  newproperty(:encryption) do
    desc "Encryption"
    newvalues(:None, :TLS, :SSL)
  end


  newproperty(:group_filter) do
    desc "Group Filter"
  end


  newproperty(:group_member_uid_attribute) do
    desc "Group Member UID Attribute"
  end


  newproperty(:group_membership_format) do
    desc "Group Membership format description"
    defaultto :User
    newvalues(:UserDn, :User)
  end


  newproperty(:group_name_attribute) do
    desc "Query For Group"
  end


  newproperty(:ip_address) do
    desc "IP Address"
  end


  newproperty(:port) do
    desc "Port"
    defaultto 389
    munge do |value|
      Integer(value)
    end
  end


  newproperty(:search_base) do
    desc "LDAP Search Base"
  end


  newproperty(:uid_attribute) do
    desc "UID Attribute"
  end


end
