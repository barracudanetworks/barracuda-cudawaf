##init.pp##
class barracudawaf {
  certificates  { 'WAFCER-1':
	  ensure 				   => present,
	  name  				   =>  'createdcert1',
	  allow_private_key_export => 'Yes',
	  city   				   => 'Bangalore',
	  common_name			   => 'waf.test.local',
	  country_code 			   => 'IN',
	  curve_type 			   => 'secp256r1',
	  key_size 				   => '1024',
	  key_type				   => 'rsa',
	  organization_name 	   => 'Barracuda Networks',
	  organization_unit 	   => 'Engineering',
	  state 				   => 'Karnataka'
}
  certificates  { 'WAFUPLOADTRUSTEDCER-1':
	  ensure 			  => present,
	  name 				  => 'trustedcert1',
	  trusted_certificate => '/home/wafcertificates/cer.pem',
	  upload 			  => 'trusted'
}
  certificates  { 'WAFUPLOADSIGNEDCER-1':
	  ensure 				   => present,
	  name 					   => 'signedcert1',
	  signed_certificate 	   => '/home/wafcertificates/root.pem',
	  allow_private_key_export => 'yes',
	  type 					   => 'pem',
	  key 					   => '/home/wafcertificates/privkey.pem',
	  assign_associated_key    => 'no',
	  upload 				   => 'signed'
}
  certificates  { 'WAFUPLOADINTERMEDIATESIGNEDCER-1':
	  ensure 				   => present,
	  name 					   => 'signedcertint1',
	  signed_certificate	   => '/home/wafcertificates/root.pem',
	  intermediary_certificate => '/home/wafcertificates/inter.pem',
	  allow_private_key_export => 'no',
	  type					   => 'pem',
	  key 					   => '/home/wafcertificates/privkey.pem',
	  assign_associated_key	   => 'no',
	  upload				   => 'signed'
}
  certificates  { 'WAFUPLOADTRUSTEDSERVERCER-1':
	  ensure 					 => present,
	  name 						 => 'trustedservercert1',
	  trusted_server_certificate => '/home/wafcertificates/cer.pem',
	  upload 					 => 'trusted_server'
}
}
