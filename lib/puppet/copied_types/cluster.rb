Puppet::Type.newtype(:cluster) do
  @doc = 'Defines all possible types for Cluster object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:cluster_name) do
    desc "Cluster Name"
    validate do |value|
      fail("Invalid cluster_name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
    end
  end


  newproperty(:cluster_shared_secret) do
    desc "Cluster Shared Secret"
  end


  newproperty(:failback_mode) do
    desc "Failback Mode"
    defaultto :Automatic
    newvalues(:Automatic, :Manual)
  end


  newproperty(:heartbeat_count_per_interface) do
    desc ""
    defaultto 2
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid heartbeat_count_per_interface #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid heartbeat_count_per_interface #{value}, Must not be greater than 200") if value > 200
    end
  end


  newproperty(:heartbeat_frequency) do
    desc ""
    defaultto 3
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid heartbeat_frequency #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid heartbeat_frequency #{value}, Must not be greater than 100") if value > 100
    end
  end


  newproperty(:monitor_link, :array_matching => :all) do
    desc ""
  end


  newproperty(:transmit_heartbeat_on, :array_matching => :all) do
    desc "Allow Administration Access"
  end


end
