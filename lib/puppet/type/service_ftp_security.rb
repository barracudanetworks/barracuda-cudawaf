Puppet::Type.newtype(:service_ftp_security) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allowed_verb_status) do
    desc "Status"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:allowed_verbs) do
    desc "FTP Allowed Verbs"
  end


  newproperty(:attack_prevention_status) do
    desc "FTP Attack Prevention"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:pasv_ports) do
    desc "PASV Ports"
    validate do |value|
      fail("Invalid pasv_ports #{value}, Illegal characters present") unless value =~ /^([0-9]{1,4}|[0-5][0-9]{4}|[6][0-4][0-9]{3}|[6][5][0-4][0-9]{2}|[6][5][5][0-2][0-9]|[6][5][5][3][0-5]|[0-9]{1,5}[-][0-9]{1,5})$/
    end
  end


  newproperty(:pasv_ip_address) do
    desc "PASV IP Address"
  end


end
