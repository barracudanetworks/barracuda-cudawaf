Puppet::Type.newtype(:system_advanced_settings) do
  @doc = 'Defines all possible types for Advanced Settings of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:action_for_stale_server) do
    desc "Action For Stale Server"
    defaultto :Disable
    newvalues(:Delete, :Disable)
  end


  newproperty(:captcha_expiry_time) do
    desc "Specifies the number of seconds the client can be idle once validated. The client will be challenged back when a request comes in after this period."
    defaultto 300
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid captcha_expiry_time #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid captcha_expiry_time #{value}, Must not be greater than 1440") if value > 1440
    end
  end


  newproperty(:captcha_success_action) do
    desc "Specifies whether the user must be redirected to the original page or given a validation success page"
    defaultto 'Redirect to the Base URL of the Original Request'
    newvalues('Redirect to the Base URL of the Original Request', 'Respond with a CAPTCHA Validation Success Page')
  end


  newproperty(:chunked_encoding_response_data) do
    desc "Chunked Encoding Response Data"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:client_ip_address_from_header) do
    desc "Use Last IP Address From Header for Client IP Address"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:csrf_token_validity) do
    desc "CSRF Token Validity Period"
    defaultto 60
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid csrf_token_validity #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid csrf_token_validity #{value}, Must not be greater than 1440") if value > 1440
    end
  end


  newproperty(:ddos_prevention_service) do
    desc "Enable/Disable Barracuda DDoS Prevention Service"
    defaultto :Disable
    newvalues(:Disable, :Enable)
  end


  newproperty(:default_log_level) do
    desc "Default System Log Level"
    defaultto :5-Notice
    newvalues(:0-Emergency, :1-Alert, :2-Critical, :3-Error, :4-Warning, :5-Notice, :6-Information, :7-Debug)
    validate do |value|
      fail("Invalid default_log_level #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid default_log_level #{value}, Must not be greater than 7") if value > 7
    end
  end


  newproperty(:enable_bruteforce_checks_for_validated_clients) do
    desc "Specifies if a client which passed CAPTCHA validations, must further be checked for bruteforce violations or not"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:javascript_failure_threshold) do
    desc "Failure Threshold"
    defaultto 64
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid javascript_failure_threshold #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid javascript_failure_threshold #{value}, Must not be greater than 1440") if value > 1440
    end
  end


  newproperty(:max_cache_size) do
    desc "Max Cache Size percent"
    defaultto HASH(0x59478ccc)
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_cache_size #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid max_cache_size #{value}, Must not be greater than HASH(0x5b2fc308)") if value > HASH(0x5b2fc308)
    end
  end


  newproperty(:max_http_requests_per_minute) do
    desc ""
    defaultto 1500
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_http_requests_per_minute #{value}, Must not be greater than 10800000") if value > 10800000
    end
  end


  newproperty(:max_https_requests_per_minute) do
    desc ""
    defaultto 1000
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_https_requests_per_minute #{value}, Must not be greater than 3000000") if value > 3000000
    end
  end


  newproperty(:persistence_across_services) do
    desc "Persistence Across Services"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:request_buffer_size) do
    desc "Request Buffer Size Limit"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid request_buffer_size #{value}, Must not be lesser than 0") if value < 0
      fail("Invalid request_buffer_size #{value}, Must not be greater than 32") if value > 32
    end
  end


  newproperty(:request_buffering) do
    desc "Request Buffering"
    defaultto :Limited
    newvalues('Full Request', 'Limited')
  end


  newproperty(:service_failure_action) do
    desc "Service Failure Action"
    defaultto 'Send Error Response'
  end


  newproperty(:suspicious_clients_track_interval) do
    desc "Specifies the number of seconds a client which is marked as Suspicious, is remembered on the Barracuda Web Application Firewall."
    defaultto 900
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid suspicious_clients_track_interval #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid suspicious_clients_track_interval #{value}, Must not be greater than 1440") if value > 1440
    end
  end


  newproperty(:url_extensions, :array_matching => :all) do
    desc "URL Extensions"
    validate do |value|
      fail("Invalid url_extensions #{value}, Illegal characters present") unless value =~ /((^[*])|(^[^\.\*]+))$/
      fail("Invalid url_extensions #{value}, Must be no longer than 512 characters") if value.length > 512
    end
  end


end
