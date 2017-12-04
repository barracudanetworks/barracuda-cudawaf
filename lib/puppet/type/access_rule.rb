Puppet::Type.newtype(:access_rule) do
  @doc = 'Defines all possible types for Access Rule object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Access Rule Name"
  end


  newproperty(:attribute_names, :array_matching => :all) do
    desc "Access Rule Attribute Names"
  end


  newproperty(:attribute_values) do
    desc "Access Rule Attribute Values"
  end


end
