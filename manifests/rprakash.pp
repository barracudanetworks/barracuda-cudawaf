class barracudawaf::rprakash {
        cudawaf_certificate  { 'WAFCER-1':
          ensure             => present,
          name               =>  'CudaCert',
          allow_private_key_export  => 'Yes',
          city               => 'Bangalore',
          common_name        => 'waf.test.local',
          country_code       => 'IN',
          curve_type         => 'secp256r1',
          key_size           => 1024,
          key_type           => 'rsa',
          organization_name  => 'Barracuda Networks',
          organization_unit  => 'Engineering',
          state              => 'Karnataka'
        }

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
