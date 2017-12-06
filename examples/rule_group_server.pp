##init.pp##
class barracudawaf {

  rule_group_server  { 'RuleGroupServer-1':
    ensure        => present,
    name          => 'rgServer1',
    service_name  => 'httpsApp1',
    rule_group_name => 'Rule1',
    identifier    => 'Hostname',
    hostname      => 'barracuda.com'
  }

  rule_group_server_advanced_configuration { 'RgServerAdvConfig-1':
    ensure        => present,
    name          => 'rgServer1',
    service_name  => 'httpsApp1',
    rule_group_name => 'Rule1',
    max_connections => 10001,
    max_establishing_connections => 101,
    max_keepalive_requests => 111,
    max_requests  => 1002
  }

  rule_group_server_in_band_health_checks { 'RgServerInBandHealthChecks-1':
    ensure        => present,
    name          => 'rgServer1',
    service_name  => 'httpsApp1',
    rule_group_name => 'Rule1',
    max_http_errors => 111,
    max_other_failure => 11,
    max_refused   => 11
  }

  rule_group_server_ssl_policy { 'RgServerSSLPolicy-1':
    ensure        => present,
    name          => 'rgServer1',
    service_name  => 'httpsApp1',
    rule_group_name => 'Rule1',
    enable_https  => 'On',
    enable_ssl_compatibility_mode => 'Yes'
  }

  rule_group_server_application_layer_health_checks { 'RgServerAppLayerHealthChecks-1':
    ensure        => present,
    name          => 'rgServer1',
    service_name  => 'httpsApp1',
    rule_group_name => 'Rule1',
    url           => '/index.html',
    domain        => 'www.example.com' 
  }

  #rule_group_server_out_of_band_health_checks { 'RgServerOOBHealthChecks-1':
  #  ensure        => present,
  #  name          => 'rgServer1',
  #  service_name  => 'httpsApp1',
  #  rule_group_name => 'Rule1',
  #  interval      => 20 
  #}

  rule_group_server_connection_pooling { 'RgServerConnPool-1':
    ensure        => present,
    name          => 'rgServer1',
    service_name  => 'httpsApp1',
    rule_group_name => 'Rule1',
    keepalive_timeout => 900001 
  }
}
