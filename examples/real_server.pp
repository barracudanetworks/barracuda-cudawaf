##init.pp##
class barracudawaf {
	real_server  {  'WAFSERVER-1':
	  ensure 	    => present,
	  name 		    => 'waftestserver1',
	  identifier	    => 'IP Address',
	  address_version   => 'IPv4',
	  status 	    => 'In Service',
	  ip_address 	    => '1.1.1.1',
	  service_name	    => 'demo_service_12',
	  port 		    => '80',
	  comments 	    => 'Creating the server'
	}
	real_server  {  'WAFSERVER-2':
	  ensure 	    => present,
	  name 		    => 'waftestserver2',
	  identifier 	    => 'Hostname',
	  address_version   => 'IPv4',
	  status 	    => 'In Service',
	  ip_address 	    => '4.4.4.4',
	  hostname 	    => 'imdb.com',
	  service_name 	    => 'demo_service_13',
	  port 		    => '80',
	  comments 	    => 'Creating the server'
	}

	real_server  {  'WAFSERVER-3':
	  ensure 	    => present,
	  name 		    => 'waftestserver3',
	  address_version   => 'IPv4',
	  status 	    => 'In Service',
	  ip_address 	    => '3.3.3.3',
	  service_name 	    => 'bhanu',
	  port 		    => '80',
	  comments 	    => 'Creating the server'
	}

}
