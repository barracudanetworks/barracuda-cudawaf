Puppet::Type.newtype(:parameter_optimizer) do
  @doc = 'Defines all possible types for Parameter Optimizer object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Optimizer Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:start_token) do
    desc "Start Token"
    validate do |value|
      fail("Invalid start_token #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid start_token #{value}, Must be no longer than 50 characters") if value.length > 50
    end
  end


end
