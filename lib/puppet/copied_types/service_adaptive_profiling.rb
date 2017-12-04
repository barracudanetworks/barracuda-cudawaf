Puppet::Type.newtype(:service_adaptive_profiling) do
  @doc = 'Defines all possible types for Adaptive Profiling of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:content_types, :array_matching => :all) do
    desc "Content Types"
  end


  newproperty(:ignore_parameters, :array_matching => :all) do
    desc "Ignore Parameters"
  end


  newproperty(:navigation_parameters, :array_matching => :all) do
    desc "Navigation Params"
  end


  newproperty(:request_learning) do
    desc "Request Learning"
    defaultto 'Successes and Redirects'
    newvalues('Successes and Redirects', 'Successes Only', 'Trusted', 'None')
  end


  newproperty(:response_learning) do
    desc "Response Learning"
    defaultto 'Successes and Redirects'
    newvalues('Successes and Redirects', 'Successes Only', 'Trusted', 'None')
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:Off, :On)
  end


  newproperty(:trusted_host_group) do
    desc "Trusted Hosts Group"
  end


end
