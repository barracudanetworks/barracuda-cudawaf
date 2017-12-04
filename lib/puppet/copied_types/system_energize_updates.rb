Puppet::Type.newtype(:system_energize_updates) do
  @doc = 'Defines all possible types for Energize Updates of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:attack_definitions_auto_update) do
    desc ""
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:geoip_definitions_auto_update) do
    desc ""
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:security_definitions_auto_update) do
    desc ""
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:virus_definitions_auto_update) do
    desc ""
    defaultto :On
    newvalues(:On, :Off)
  end


end
