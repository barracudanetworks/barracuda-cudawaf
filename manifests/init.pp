node "rprakash" {
 barracudawaf {
	wafservices  { 'WAFSVC-1':
	  ensure        => present,
	  name          => 'httpsApp1',
	  type          => 'http',
	  ip_address    => '10.36.73.111',
	  port          => '80',
	  group         => 'default',
	  vsite         => 'default',
	  status                => 'On',
	  address_version       => 'ipv4',
	  comments      => 'Updating the comments',
	}
  }
}
