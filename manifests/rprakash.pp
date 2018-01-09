class barracudawaf::rprakash {
	cudawaf_service  { 'DemoService':
	  ensure       	    => absent,
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
}
