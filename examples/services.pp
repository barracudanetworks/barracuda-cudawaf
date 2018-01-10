class barracudawaf {
    cudawaf_service  { 'WAFSVC-1':
      ensure            => present,
      name              => 'MyService',
      type              => 'http',
      dps_enabled       => 'no',
      mask              => '255.255.255.255',
      ip_address        => '3.3.3.3',
      port              => 80,
      group             => 'default',
      vsite             => 'default',
      status            => 'On',
      address_version   => 'IPv4',
      comments          => 'Updating the comments',
      app_id            => '1',
      enable_access_logs => 'Yes',
      session_timeout   => 60,
    }

    cudawaf_service { 'WAFSVC-2':
      ensure        => present,
      name          => 'DemoService1',
      type          => 'http',
      dps_enabled   => 'no',
      mask          => '255.255.255.255',
      ip_address    => '6.6.6.6',
      port          => 80,
      group         => 'default',
      vsite         => 'default',
      status        => 'On',
      address_version => 'IPv4',
      comments      => 'Creating the demo_service_12',
      app_id        => '1',
      enable_access_logs => 'Yes',
      session_timeout => 60,
    }

    cudawaf_service { 'WAFSVC-3':
      ensure        => present,
      name          => 'DemoService2',
      type          => 'http',
      dps_enabled   => 'no',
      mask          => '255.255.255.255',
      ip_address    => '8.8.8.8',
      port          => 80,
      group         => 'default',
      vsite         => 'default',
      status        => 'On',
      address_version => 'IPv4',
      comments      => 'updating the demo_service_13',
      app_id        => '1',
      enable_access_logs => 'Yes',
      session_timeout => 60,
    }
}
