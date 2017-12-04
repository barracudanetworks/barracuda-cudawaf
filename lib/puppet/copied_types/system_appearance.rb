Puppet::Type.newtype(:system_appearance) do
  @doc = 'Defines all possible types for Appearance of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:login_notice) do
    desc "Login Notice"
  end


  newproperty(:logo_url) do
    desc "Web Interface Logo URL"
    validate do |value|
      fail("Invalid logo_url #{value}, Illegal characters present") unless value =~ /(^[hH][tT][tT][pP][sS]?[\:][\/][\/][^*\s]+$)/
    end
  end


end
