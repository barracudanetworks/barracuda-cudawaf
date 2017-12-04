Puppet::Type.newtype(:administrator_role) do
  @doc = 'Defines all possible types for Administrator Role object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Role Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allowed_screens, :array_matching => :all) do
    desc "Specify Allowed Screens"
  end


  newproperty(:authentication_services, :array_matching => :all) do
    desc "Auth Services"
  end


  newproperty(:denied_screens, :array_matching => :all) do
    desc "Denied Screens"
  end


  newproperty(:role_type) do
    desc ""
    defaultto :Local
  end


  newproperty(:security_policies, :array_matching => :all) do
    desc "Security Policies"
  end


  newproperty(:service_groups, :array_matching => :all) do
    desc "Service Group"
  end


  newproperty(:services, :array_matching => :all) do
    desc "Services"
  end


  newproperty(:vsites, :array_matching => :all) do
    desc "Vsites"
  end


end
