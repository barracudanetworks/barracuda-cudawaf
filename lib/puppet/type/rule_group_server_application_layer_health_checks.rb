Puppet::Type.newtype(:rule_group_server_application_layer_health_checks) do
  @doc = 'Defines all possible types for Application Layer Health Checks of Rule Group Server object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Server Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 255 characters") if value.length > 255
    end
  end


  newparam(:rule_group_name, :namevar => true) do
    desc "Rule Group Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newparam(:service_name, :namevar => true) do
    desc 'Service Name'
    validate do |value|
      fail("Invalid service_name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._:\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:additional_headers, :array_matching => :all) do
    desc "Additional Headers"
  end


  newproperty(:domain) do
    desc "Domain"
  end


  newproperty(:match_content_string) do
    desc "Match content String"
  end


  newproperty(:method) do
    desc "Method"
    defaultto :GET
    newvalues(:GET, :HEAD, :POST)
  end


  newproperty(:status_code) do
    desc "Status Code"
    defaultto 200
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid status_code #{value}, Must not be lesser than 100") if value < 100
      fail("Invalid status_code #{value}, Must not be greater than 999") if value > 999
    end
  end


  newproperty(:url) do
    desc "URL"
    validate do |value|
      fail("Invalid url #{value}, Illegal characters present") unless value =~ /(^\/([^*])*$)|(^\/[^*]*[*][^*]*$)/
      fail("Invalid url #{value}, Must be no longer than 950 characters") if value.length > 950
      fail("Invalid url #{value}, Must be no shorter than 1 characters") if value.length < 1
    end
  end


  def self.title_patterns
     [ [ /(.*)/m, [ [:name] ] ] ]
  end


end
