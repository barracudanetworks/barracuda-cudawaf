class barracudawaf::rprakash {
	cudawaf_service  { 'DemoService':
	  ensure       	    => present,
	  name              => 'MyService',
	  type              => 'HTTP',
	  ip_address        => '10.11.1.1',
	  port              => 80,
	  group             => 'default',
	  vsite             => 'default',
	  status            => 'On',
	  address_version   => 'IPv4',
	  comments          => 'Demo service',
	}

        cudawaf_server  {  'Real Server':
          ensure           => present,
          name             => 'DemoServer',
          identifier       => 'IP Address',
          address_version  => 'IPv4',
          status           => 'In Service',
          ip_address       => '5.5.5.5',
          service_name     => 'MyService',
          port             => 80,
          comments         => 'Creating the server'
        }
}
