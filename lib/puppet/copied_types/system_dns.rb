Puppet::Type.newtype(:system_dns) do
  @doc = 'Defines all possible types for Dns of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:primary_dns_server) do
    desc "Primary DNS Server"
  end


  newproperty(:secondary_dns_server) do
    desc "Secondary DNS Server"
  end


end
