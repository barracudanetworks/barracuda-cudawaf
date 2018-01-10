class barracudawaf::skannan {
	cudawaf_service  { 'DemoService2':
	  ensure       	    => present,
	  name              => 'MyService2',
	  type              => 'HTTP',
	  ip_address        => '10.11.2.2',
	  port              => 8000,
	  group             => 'default',
	  vsite             => 'default',
	  status            => 'On',
	  address_version   => 'IPv4',
	  comments          => 'Demo service',
	}

        cudawaf_security_policy  {  'securitypolicy1':
          ensure            => present,
          name              => 'custom',
        }
}
