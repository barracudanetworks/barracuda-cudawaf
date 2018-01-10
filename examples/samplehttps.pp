class barracudawaf {
    cudawaf_certificate { 'WAFCER-1':
      ensure => present,
      name  => 'createdcert1',
      allow_private_key_export =>'Yes',
      city   =>'Bangalore',
      common_name=> 'waf.test.local',
      country_code => 'IN',
      key_size => 1024,
      key_type => 'rsa',
      organization_name => 'Barracuda Networks',
      organization_unit => 'Engineering',
      state => 'Karnataka',
    }

    cudawaf_service { 'WAFSVC-1':
      ensure        => present,
      name          => 'httpsApp1',
      type          => 'https',
      ip_address    => '10.36.73.245',
      port          => 8443,
      certificate   => 'createdcert1',
      group         => 'default',
      vsite         => 'default',
      status        => 'On',
      address_version => 'IPv4',
      comments      => 'Updating the comments',
    }

    cudawaf_server { 'WAFSERVER-2':
      ensure => present,
      name => 'waftestserver2',
      identifier => 'IP Address',
      address_version => 'IPv4',
      status => 'In Service',
      ip_address => '5.5.5.5',
      hostname => '',
      service_name => 'httpsApp1',
      port => 80,
      comments => 'Creating the server'
    }
}
