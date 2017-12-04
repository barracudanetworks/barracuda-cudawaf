Puppet::Type.newtype(:system_network_configuration) do
  @doc = 'Defines all possible types for Network Configuration of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:enable_snat_for_lan_servers) do
    desc "Automatically add SNAT and ACL rules for Real Servers"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:higher_precedence_for_acls) do
    desc "Higher Precedence for ACL"
    defaultto :System
    newvalues(:System, :Vsites)
  end


  newproperty(:mtu_for_lan) do
    desc "MTU for LAN"
    defaultto 1500
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid mtu_for_lan #{value}, Must not be lesser than 576") if value < 576
      fail("Invalid mtu_for_lan #{value}, Must not be greater than 1500") if value > 1500
    end
  end


  newproperty(:mtu_for_mgmt) do
    desc "MTU for MGMT"
    defaultto 1500
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid mtu_for_mgmt #{value}, Must not be lesser than 576") if value < 576
      fail("Invalid mtu_for_mgmt #{value}, Must not be greater than 1500") if value > 1500
    end
  end


  newproperty(:mtu_for_wan) do
    desc "MTU for WAN"
    defaultto 1500
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid mtu_for_wan #{value}, Must not be lesser than 576") if value < 576
      fail("Invalid mtu_for_wan #{value}, Must not be greater than 1500") if value > 1500
    end
  end


  newproperty(:syn_guard) do
    desc ""
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:tcp_timestamp) do
    desc ""
    defaultto :On
    newvalues(:On, :Off)
  end


end
