class barracudawaf {
        cudawaf_rule_group_server  { 'RuleGroupServer-1':
          ensure        => absent,
          name          => 'rgServer1',
          service_name  => 'MyService2',
          rule_group_name => 'ContentRule1',
          identifier    => 'Hostname',
          hostname      => 'barracuda.com'
        }
}
