Puppet::Type.newtype(:cluster_nodes) do
  @doc = 'Defines all possible types for Nodes of Cluster object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:ip_address, :array_matching => :all) do
    desc "Cluster System"
  end


  newproperty(:mode) do
    desc ""
  end


  newproperty(:serial) do
    desc ""
  end


end
