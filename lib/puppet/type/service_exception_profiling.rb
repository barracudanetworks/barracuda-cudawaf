Puppet::Type.newtype(:service_exception_profiling) do
  @doc = 'Defines all possible types for Exception Profiling of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:exception_profiling_learn_from_trusted_host) do
    desc "Learn From Trusted Host Group"
    defaultto :No
    newvalues(:No, :Yes)
  end


  newproperty(:exception_profiling_level) do
    desc "Exception Profiling Level"
    defaultto :None
    newvalues(:None, :Low, :Medium, :High)
  end


  newproperty(:exception_profiling_trusted_host_group) do
    desc "Trusted Hosts Group"
  end


end
