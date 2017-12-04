Puppet::Type.newtype(:url_policy) do
  @doc = 'Defines all possible types for URL Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "URL Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:comments) do
    desc "Comments"
    validate do |value|
      fail("Invalid comments #{value}, Illegal characters present") unless value =~ /^.*$/
      fail("Invalid comments #{value}, Must be no longer than 256 characters") if value.length > 256
    end
  end


  newproperty(:count_window) do
    desc "Count Window"
    defaultto 60
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid count_window #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid count_window #{value}, Must not be greater than 3600") if value > 3600
    end
  end


  newproperty(:counting_criterion) do
    desc "Counting Criterion"
    defaultto 'Per IP'
    newvalues('Per IP', 'All Sources')
  end


  newproperty(:enable_batd_scan) do
    desc "Enable BATP Scan"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_bruteforce_prevention) do
    desc "Enable Bruteforce Prevention"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_data_theft_protection) do
    desc "Enable Data Theft Protection"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_invalid_status_code_only) do
    desc "Enable Invalid Status Code Only"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_virus_scan) do
    desc "Enable Virus Scan"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:exception_clients) do
    desc "Exception Clients"
  end


  newproperty(:extended_match) do
    desc "Extended Match"
    defaultto :*
  end


  newproperty(:extended_match_sequence) do
    desc "Extended Match Sequence"
    defaultto 1
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid extended_match_sequence #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid extended_match_sequence #{value}, Must not be greater than 1000") if value > 1000
    end
  end


  newproperty(:host) do
    desc "Host Match"
    defaultto :*
    validate do |value|
      fail("Invalid host #{value}, Illegal characters present") unless value =~ /((^[*])|(^([a-zA-Z0-9.\-\_]*[*]?[a-zA-Z0-9.\-\_]+){2,}))$/
      fail("Invalid host #{value}, Must be no longer than 128 characters") if value.length > 128
    end
  end


  newproperty(:max_allowed_accesses_from_all_sources) do
    desc "Max Allowed Accesses From All Sources"
    defaultto 100
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_allowed_accesses_from_all_sources #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_allowed_accesses_from_all_sources #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:max_allowed_accesses_per_ip) do
    desc "Max Allowed Accesses Per IP"
    defaultto 10
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_allowed_accesses_per_ip #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_allowed_accesses_per_ip #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:max_bandwidth_from_all_sources) do
    desc "Max Bandwidth From All Sources"
    defaultto 0
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_bandwidth_from_all_sources #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_bandwidth_from_all_sources #{value}, Must not be greater than 10485760") if value > 10485760
    end
  end


  newproperty(:max_bandwidth_per_ip) do
    desc "Max Bandwidth Per IP"
    defaultto 0
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_bandwidth_per_ip #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_bandwidth_per_ip #{value}, Must not be greater than 1048576") if value > 1048576
    end
  end


  newproperty(:max_failed_accesses_from_all_sources) do
    desc "Max Failed Accesses From All Sources"
    defaultto 100
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_failed_accesses_from_all_sources #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_failed_accesses_from_all_sources #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:max_failed_accesses_per_ip) do
    desc "Max Failed Accesses Per IP"
    defaultto 10
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_failed_accesses_per_ip #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_failed_accesses_per_ip #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:mode) do
    desc "Mode"
    defaultto :Active
    newvalues(:Passive, :Active)
  end


  newproperty(:parse_urls_in_scripts) do
    desc "Parse URLs in Scripts"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:rate_control_pool) do
    desc "Rate Control Pool"
    defaultto :NONE
  end


  newproperty(:response_charset) do
    desc "Response Charset"
    defaultto :NONE
    newvalues(:ASCII, :ISO-8859-1, :UTF-8, :GBK, :GB2312, :ISO-2022-CN, :HZ, :BIG5, :EUC-TW, :Shift-JIS, :EUC-JP, :ISO-2022-JP, :EUC-KR, :JOHAB, :ISO-2022-KR, :NONE)
  end


  newproperty(:status) do
    desc "Status"
    defaultto :On
    newvalues(:On, :Off)
  end


  newproperty(:url) do
    desc "URL Match"
    validate do |value|
      fail("Invalid url #{value}, Illegal characters present") unless value =~ /(^\/([^*?<>&\s])*$)|(^\/[^*?<>&\s]*[*][^*?<>&\s]*$)/
      fail("Invalid url #{value}, Must be no longer than 5000 characters") if value.length > 5000
    end
  end


  newproperty(:web_scraping_policy) do
    desc "Web Scraping Policy"
    defaultto :NONE
  end


end
