class barracudawaf {

  service_url_encryption  {  'ServiceURLEncryption-1':
    ensure          => present,
    name            => 'httpsApp1',
    status          => 'On'
  }
  service_authentication {   'ServiceAuth-1':
    ensure          => present,
    name            => 'httpsApp1',
    status          => 'On'
  }
  service_basic_security {   'ServiceBasicSecurity-1':
    ensure          => present,
    name            => 'httpsApp1',
    mode            => 'Active',
    web_firewall_policy => 'owa'
  }
  service_instant_ssl {   'ServiceInstantSSL-1':
    ensure          => present,
    name            => 'httpsApp1',
    status          => 'On',
    secure_site_domain => 'www.example.com' 
  }
  service_caching {   'ServiceCaching-1':
    ensure          => present,
    name            => 'httpsApp1',
    status          => 'On',
    expiry_age      => 61
  }
  service_compression {  'ServiceCompression-1':
    ensure          => present,
    name            => 'httpsApp1',
    status          => 'On',
  }
  service_clickjacking {  'ServiceClickJacking-1':
    ensure          => present,
    name            => 'httpsApp1',
    status          => 'On',
    options         => 'Never'
  }
  service_load_balancing {  'ServiceLoadBalancing-1':
    ensure          => present,
    name            => 'httpsApp1',
    algorithm       => 'Least Requests'
  }
  service_sensitive_parameter_names {  'ServiceSensitiveParamName-1':
    ensure          => present,
    name            => 'httpsApp1',
    sensitive_parameter_names => 'UserName,Password,CreditCardNumber' 
  }
  service_slow_client_attack {  'ServiceSlowClientAttack-1':
    ensure          => present,
    name            => 'httpsApp1',
    status          => 'On' 
  }
  service_website_profile { 'ServiceWebsiteProfile-1':
    ensure          => present,
    name            => 'httpsApp1',
    strict_profile_check => 'Yes'
  }
  service_adaptive_profiling  {  'ServiceAdaptiveProfiling-1':
    ensure          => present,
    name            => 'httpsApp1',
    status          => 'On',
    response_learning => 'Successes Only',
    request_learning => 'Successes Only'
  }
  service_advanced_configuration  {  'ServiceAdvancedConfiguration-1':
    ensure          => present,
    name            => 'httpsApp1',
    enable_vdi          => 'No',
    enable_web_application_firewall => 'No',
    enable_websocket => 'Yes'
  }

}
