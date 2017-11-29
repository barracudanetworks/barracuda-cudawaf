class barracudawaf {
  
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
