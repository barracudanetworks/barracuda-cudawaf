class barracudawaf {
        cudawaf_rule_group {  'RuleGroup-1':
          ensure            => present,
          name              => 'ContentRule1',
          service_name      => 'MyService2',
          url_match         => '/testing.html',
          host_match        => 'www.example.com'
        }
}
