Puppet::Type.newtype(:network_acl) do
  @doc = 'Defines all possible types for Network ACL object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


  newproperty(:acl_type) do
    desc "Type"
    defaultto :Service
    newvalues(:Service, :Server)
  end


  newproperty(:action) do
    desc "Action"
    defaultto :Allow
    newvalues(:Allow, :Deny)
  end


  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
    end
  end


  newproperty(:destination_address) do
    desc "Destination IP Address"
  end


  newproperty(:destination_netmask) do
    desc "Destination Netmask"
  end


  newproperty(:destination_port) do
    desc "Destination Port Range"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid destination_port #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid destination_port #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:enable_logging) do
    desc "Log Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:icmp_response) do
    desc "ICMP Response"
  end


  newproperty(:interface) do
    desc "Interface"
    defaultto :Any
  end


  newproperty(:ip_version) do
    desc "IP Protocol Version"
    defaultto :IPv4
    newvalues(:IPv4, :IPv6)
  end


  newproperty(:max_connections) do
    desc "Max Number of Connections"
    defaultto 0
    munge do |value|
      Integer(value)
    end
  end


  newproperty(:max_half_open_connections) do
    desc "Max Connection Rate"
    defaultto 0
    munge do |value|
      Integer(value)
    end
  end


  newproperty(:priority) do
    desc "Priority"
    munge do |value|
      Integer(value)
    end
  end


  newproperty(:protocol) do
    desc "Protocol"
    defaultto :ALL-PROTOCOLS
  end


  newproperty(:source_address) do
    desc "Source IP Address"
  end


  newproperty(:source_netmask) do
    desc "Source Netmask"
  end


  newproperty(:source_port) do
    desc "Source Port Range"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid source_port #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid source_port #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:status) do
    desc "Log Status"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:vsite) do
    desc "Network Group"
    defaultto :default
  end


end
