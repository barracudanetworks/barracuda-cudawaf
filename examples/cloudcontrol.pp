class barracudawaf {
    cudawaf_cloudcontrol { 'WAFCloudControlSettings':
      ensure         => present,
      connect_mode   => 'cloud',
      state          => 'connected',
      username       => 'customer_account@example.com',
      password       => 'xxxxxxxx'
    }
}
