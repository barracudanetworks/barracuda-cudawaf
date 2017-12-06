Puppet::Type.newtype(:rule_group_server_ssl_policy) do
  @doc = 'Defines all possible types for Ssl Policy of Rule Group Server object on the Barracuda Web Application Firewall.'

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


  newproperty(:client_certificate) do
    desc "Client Certificate"
  end


  newproperty(:enable_https) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:enable_sni) do
    desc "Enable SNI"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_ssl_3) do
    desc "SSL 3.0"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_ssl_compatibility_mode) do
    desc "Enable SSL Compatibility Mode"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_tls_1) do
    desc "TLS 1.0 (Insecure)"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_tls_1_1) do
    desc "TLS 1.1"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:enable_tls_1_2) do
    desc "TLS 1.2"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:validate_certificate) do
    desc "Validate Server Certificate"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  def self.title_patterns
     [ [ /(.*)/m, [ [:name] ] ] ]
  end


end
