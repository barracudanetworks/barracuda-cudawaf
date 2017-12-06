class barracudawaf {

  rule_group {  'RuleGroup-1':
    ensure          => present,
    name            => 'Rule1',
    service_name    => 'httpsApp1',
    url_match       => '/testing.html',
    host_match      => 'www.example.com'
  }

  rule_group_caching {  'RuleGroupCaching-1':
    ensure          => present,
    name            => 'Rule1',
    service_name    => 'httpsApp1',
    status          => 'On',
    max_size        => 512 
  }

  rule_group_compression {  'RuleGroupCompression-1':
    ensure          => present,
    name            => 'Rule1',
    service_name    => 'httpsApp1',
    status          => 'On',
    min_size        => 10111
  }
}
