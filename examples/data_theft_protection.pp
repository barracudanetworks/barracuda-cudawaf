class barracudawaf {

  data_theft_protection { 'DataTheftProtection-1':
     ensure          => present,
     name            => 'test1',
     policy_name     => 'default',
     enable          => 'Yes',
     action          => 'Cloak',
     identity_theft_type => 'Credit Cards',
     initial_characters_to_keep => 2,
     trailing_characters_to_keep => 5
   }

}
