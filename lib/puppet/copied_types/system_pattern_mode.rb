Puppet::Type.newtype(:system_pattern_mode) do
  @doc = 'Defines all possible types for Pattern Mode of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:default_mode_for_new_patterns) do
    desc ""
    defaultto :Passive
    newvalues(:Active, :Passive, :Off)
  end


  newproperty(:default_mode_for_updated_patterns) do
    desc ""
    defaultto :Active
    newvalues(:Active, :Passive, :Off)
  end


end
