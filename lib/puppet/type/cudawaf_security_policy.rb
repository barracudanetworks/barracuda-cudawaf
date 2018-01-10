Puppet::Type.newtype(:cudawaf_security_policy) do
  @doc = 'Defines all possible types for Security Policy object on the Barracuda Web Application Firewall.'

  apply_to_device
  ensurable

  newparam(:name, namevar: true) do
    desc 'Policy Name'
    validate do |value|
      raise("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      raise("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end
end
