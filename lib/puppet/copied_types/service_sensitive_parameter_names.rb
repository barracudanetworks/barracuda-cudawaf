Puppet::Type.newtype(:service_sensitive_parameter_names) do
  @doc = 'Defines all possible types for Sensitive Parameter Names of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:sensitive_parameter_names) do
    desc "Sensitive Parameter Names"
    validate do |value|
      fail("Invalid sensitive_parameter_names #{value}, Illegal characters present") unless value =~ /^([[:alpha:]_$\*][[:alnum:]_\-.:,$@#\*\[\]%\s]*)$/
      fail("Invalid sensitive_parameter_names #{value}, Must be no longer than 1024 characters") if value.length > 1024
      fail("Invalid sensitive_parameter_names #{value}, Must be no shorter than 1 characters") if value.length < 1
    end
  end


end
