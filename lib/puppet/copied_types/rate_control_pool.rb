Puppet::Type.newtype(:rate_control_pool) do
  @doc = 'Defines all possible types for Rate Control Pool object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Rate Control Pool Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:max_active_requests) do
    desc "Maximum Active Requests"
    defaultto 100
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_active_requests #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_active_requests #{value}, Must not be greater than 32767") if value > 32767
    end
  end


  newproperty(:max_per_client_backlog) do
    desc "Maximum Per Client Backlog"
    defaultto 32
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_per_client_backlog #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_per_client_backlog #{value}, Must not be greater than 100") if value > 100
    end
  end


  newproperty(:max_unconfigured_clients) do
    desc "Maximum Unconfigured Clients"
    defaultto 100
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_unconfigured_clients #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_unconfigured_clients #{value}, Must not be greater than 32767") if value > 32767
    end
  end


end
