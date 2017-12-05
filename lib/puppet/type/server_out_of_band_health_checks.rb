Puppet::Type.newtype(:server_out_of_band_health_checks) do
  @doc = 'Defines all possible types for Out Of Band Health Checks of Server object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Server Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 255 characters") if value.length > 255
    end
  end


  newparam(:service_name, :namevar => true) do
    desc 'Service Name'
    validate do |value|
      fail("Invalid service_name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:enable_OOB_health_checks) do
    desc "Enable OOB Health Checks"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:interval) do
    desc "Interval"
    defaultto 10
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid interval #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid interval #{value}, Must not be greater than 10000") if value > 10000
    end
  end


  def self.title_patterns
     [ [ /(.*)/m, [ [:name] ] ] ]
  end


end
