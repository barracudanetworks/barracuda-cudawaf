class barracudawaf {

  server_advanced_configuration {  'ServerAdvancedConfiguration-1':
    ensure          => present,
    name            => 'wafServer2',
    service_name    => 'httpsApp1',
    max_keepalive_requests => 121,
    max_spare_connections  => 111 
  }

  server_application_layer_health_checks {  'ServerAppHealthCheck-1':
    ensure          => present,
    name            => 'wafServer2',
    service_name    => 'httpsApp1',
    url             => '/index.html' 
  } 

  server_connection_pooling {  'ServerConnPool-1':
    ensure          => present,
    name            => 'wafServer2',
    service_name    => 'httpsApp1',
    keepalive_timeout => 910000 
  }

  server_in_band_health_checks {  'ServerInBandHealthCheck-1':
    ensure          => present,
    name            => 'wafServer2',
    service_name    => 'httpsApp1',
    max_http_errors => 11,
    max_refused     => 11 
  }

  server_load_balancing {  'ServerLoadBalancing-1':
    ensure          => present,
    name            => 'wafServer2',
    service_name    => 'httpsApp1',
    weight          => 2
  }

  server_ssl_policy {  'ServerSSLPolicy-1':
    ensure          => present,
    name            => 'wafServer2',
    service_name    => 'httpsApp1',
    enable_https    => 'Yes' 
  }

  server_out_of_band_health_checks {  'ServerOOBHealthChecks-1':
    ensure          => present,
    name            => 'wafServer2',
    service_name    => 'httpsApp1',
    interval        => 12
  }

}
