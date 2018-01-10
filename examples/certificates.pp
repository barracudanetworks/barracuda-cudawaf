class barracudawaf {
    cudawaf_certificate { 'WAFCER-1':
      ensure => present,
      name  => 'createdcert1',
      allow_private_key_export =>'Yes',
      city   =>'Bangalore',
      common_name=> 'waf.test.local',
      country_code => 'IN',
      curve_type => 'secp256r1',
      key_size => 1024,
      key_type => 'rsa',
      organization_name => 'Barracuda Networks',
      organization_unit => 'Engineering',
      state => 'Karnataka',
    }

    cudawaf_certificate { 'WAFUPLOADTRUSTEDCER-1':
      ensure => present,
      name => 'trustedcert1',
      trusted_certificate => '/home/certificates/cer.pem',
      upload => 'trusted'
    }

    cudawaf_certificate { 'WAFUPLOADSIGNEDCER-1':
      ensure => present,
      name => 'signedcert1',
      signed_certificate => '/home/certificates/root.pem',
      allow_private_key_export => 'yes',
      type => 'pem',
      key =>'/home/cudawaf_certificate/privkey.pem',
      assign_associated_key => 'no',
      upload => 'signed'
    }

    cudawaf_certificate { 'WAFUPLOADINTERMEDIATESIGNEDCER-1':
      ensure => present,
      name => 'signedcertint1',
      signed_certificate => '/home/certificates/root.pem',
      intermediary_certificate => '/home/certificates/inter.pem',
      allow_private_key_export => 'no',
      type => 'pem',
      key =>'/home/cudawaf_certificate/privkey.pem',
      assign_associated_key => 'no',
      upload => 'signed'
    }

    cudawaf_certificate { 'WAFUPLOADTRUSTEDSERVERCER-1':
      ensure => present,
      name => 'trustedservercert1',
      trusted_server_certificate => '/home/certificates/cer.pem',
      upload => 'trusted_server'
    }
}
