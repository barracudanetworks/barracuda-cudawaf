Puppet::Type.newtype(:service_website_profile) do
  @doc = 'Defines all possible types for Website Profile of Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:allowed_domains, :array_matching => :all) do
    desc "Allowed Domains"
    validate do |value|
      fail("Invalid allowed_domains #{value}, Illegal characters present") unless value =~ /((^[*])|(^([a-zA-Z0-9.\-\_]*[*]?[a-zA-Z0-9.\-\_]+){2,}))$/
      fail("Invalid allowed_domains #{value}, Must be no longer than 128 characters") if value.length > 128
    end
  end


  newproperty(:exclude_url_patterns, :array_matching => :all) do
    desc "Exclude URL Patterns"
  end


  newproperty(:include_url_patterns, :array_matching => :all) do
    desc "Include URL Patterns"
  end


  newproperty(:mode) do
    desc "Mode"
    defaultto :Passive
    newvalues(:Learning, :Passive, :Active)
  end


  newproperty(:strict_profile_check) do
    desc "Strict Profile Check"
    defaultto :No
    newvalues(:No, :Yes)
  end


  newproperty(:use_profile) do
    desc "Use Profile"
    defaultto :Yes
    newvalues(:No, :Yes)
  end


end
