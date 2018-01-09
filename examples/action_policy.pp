class barracudawaf {

  action_policy { 'ActionPolicy-1':
     ensure          => present,
     name            => 'sql-injection-pattern-in-parameter',
     policy_name     => 'default',
     follow_up_action_time => 60
   } 

}
