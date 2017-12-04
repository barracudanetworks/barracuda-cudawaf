Puppet::Type.newtype(:web_scraping_policy) do
  @doc = 'Defines all possible types for Web Scraping Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Scraping Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:comments) do
    desc "Comment"
  end


  newproperty(:delay_time) do
    desc "Delay Time"
    validate do |value|
      fail("Invalid delay_time #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid delay_time #{value}, Must not be greater than 500") if value > 500
      fail("Invalid delay_time #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:insert_delay) do
    desc "Insert Delay in Robots.txt"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:insert_disallowed_urls) do
    desc "Insert Disallowed URLs in Robots.txt"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:insert_hidden_links) do
    desc "Insert Hidden Links in Response"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:insert_javascript_in_response) do
    desc "Insert JavaScript in Response"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:whitelisted_bots, :array_matching => :all) do
    desc "Bind Whitelist"
  end


end
