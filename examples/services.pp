##init.pp##
class barracudawaf {
	services  {  'WAFSVC-1':
	  ensure        		=> present,
	  name          		=> 'bhanu',
	  type          		=> 'http',
	  dps_enabled   		=> 'no',
	  mask          		=> '255.255.255.255',
	  ip_address    		=> '3.3.3.3',
	  port          		=> '80',
	  group         		=> 'default',
	  vsite         		=> 'default',
	  status                => 'On',
	  address_version       => 'ipv4',
	  comments      		=> 'Updating the comments',
	  app_id                => '1',
	  enable_access_logs 	=> 'Yes',
	  session_timeout       => '60'
	}

	services  {  'WAFSVC-2':
	  ensure        		=> present,
	  name          		=> 'demo_service_12',
	  type          		=> 'http',
	  dps_enabled   		=> 'no',
	  mask          		=> '255.255.255.255',
	  ip_address    		=> '6.6.6.6',
	  port          		=> '80',
	  group         		=> 'default',
	  vsite         		=> 'default',
	  status                => 'On',
	  address_version       => 'ipv4',
	  comments      		=> 'Creating the demo_service_12',
	  app_id                => '1',
	  enable_access_logs 	=> 'Yes',
	  session_timeout       => '60'
	}

	services  {  'WAFSVC-3':
	  ensure        		=> present,
	  name          		=> 'demo_service_13',
	  type          		=> 'http',
	  dps_enabled   		=> 'no',
	  mask          		=> '255.255.255.255',
	  ip_address    		=> '8.8.8.8',
	  port         		    => '80',
	  group         		=> 'default',
	  vsite         		=> 'default',
	  status                => 'On',
	  address_version       => 'ipv4',
	  comments      		=> 'updating the demo_service_13',
	  app_id                => '1',
	  enable_access_logs 	=> 'Yes',
	  session_timeout       => '60'
	}
}
