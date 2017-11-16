class samplehttps {
  wafcertificates{ 'WAFCER-1':
    ensure => present,
    name  => 'createdcert1',
    city   =>'Bangalore',
    state => 'Karnataka',
    common_name=> 'waf.test.local',
    country_code => 'IN',
    key_size => 1024,
    key_type => 'rsa',
    organization_name => 'Barracuda Networks',
    organization_unit => 'Engineering',
    allow_private_key_export =>'Yes',
  }

  wafservices  { 'WAFSVC-1':
    ensure        => present,
    name          => 'httpsApp1',
    type          => 'HTTPS',
    ip_address    => '10.36.73.245',
    port          => 8443,
    certificate   => 'createdcert1',
    group         => 'default',
    vsite         => 'default',
    status                => 'On',
    address_version       => 'IPv4',
    comments      => 'Updating the comments',
  }

  wafservers{ 'WAFSERVER-2':
    ensure => present,
    name => 'waftestserver2',
    identifier => 'Hostname',
    address_version => 'IPv4',
    status => 'In Service',
    ip_address => '5.5.5.5',
    hostname => 'imdb.com',
    service_name => 'httpsApp1',
    port => 80,
    comments => 'Creating the server'
  }

  wafcloudcontrol{ 'WAFCLOUDCONTROL-1':
    ensure => present,
    state => 'connected',
    connect_mode => 'cloud',
    username  => 'rprakash@barracuda.com',
    password => 'password'
  }
}
