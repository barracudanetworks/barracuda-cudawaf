Puppet::Type.newtype(:wafservers) do
  @doc = 'Type representing a Server object on the Barracuda Web Application Firewall.'

ensurable
  newparam(:name, :namevar => true) do
    desc 'Server Name'
    validate do |value|
      fail 'name should not be blank' if value == ''
    end
  end   

  newproperty(:identifier) do
    desc 'Identifier'
    defaultto:'255.255.255.255'
  end

  newparam(:port) do
   desc 'Server Port'
   defaultto:'80'
  end

  newparam(:comments) do
    desc 'Comments'
    defaultto:comments
  end

  newproperty(:address_version) do
    desc 'Version'
    defaultto:IPv4
  end

  newparam(:hostname) do
    desc 'Hostname'
  end

  newproperty(:status) do
    desc 'Status'
    defaultto:'In Service'
  end

  newparam(:ip_address) do
    desc 'Server IP'
  end
 
  newparam(:service_name) do
    desc 'Service name'
  end

end

