class barracudawaf {

  global_acl { 'GlobalAcl-1':
    ensure          => present,
    name            => 'test1',
    policy_name     => 'default',
    action          => 'Deny and Log',
    deny_response   => 'Response Page',
    enable          => 'Yes',
    follow_up_action => 'None',
    response_page   => 'default',
    url             => '/testing/test2'
  }

}
