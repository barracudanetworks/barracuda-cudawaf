
### Table of Contents

1. [Description](#description)
2. [Types](#about-the-resource-types)
2. [Setup - The basics of getting started with cudawaf](#setup)
3. [Usage - Configuration options and additional functionality](#usage-examples)
4. [Reference - An under-the-hood peek at what the module is doing and how](reference---an-under-the-hood-peek-at-what-the-module-is-doing-and-how)
  * [Service](#cudawaf_service)
  * [Server](#cudawaf_server)
  * [Certificates](#cudawaf_certificate)
  * [Cloud Control](#cudawaf_cloudcontrol)
  * [Security_Policy](#cudawaf_security_policy)
  * [Rule_Group](#cudawaf_rule_group)
  * [Rule_Group_Server](#cudawaf_rule_group_server)


## Description

With the Barracuda Web Application Firewall, administrators do not need to wait for clean code or even know how an application works to secure their applications. Organizations can ensure robust security with a Barracuda Web Application Firewall hardware or virtual appliance, deployed either on-premises or in the cloud.
This module enables management of the Barracuda Web Application Firewall using Puppet..

## About the Resource Types

The following features can be configured using this module:

### Service
A Virtual Service is a combination of a Virtual IP (VIP) address and a TCP port, which listens and directs the traffic to the 		intended Service. The resource type for this feature is "cudawaf_service".


### Server 
A server object can be used to configure the networking information of the back-end server to be hosted on the Barracuda Web 		Application Firewall. Multiple real servers can be added and configured to load balance the incoming traffic for a Service. The 	resource type for this feature is "cudawaf_server".

### Certificates
A signed certificate is a digital identity document that enables both server and client to authenticate each other.  Certificates 	  are used with HTTPS protocol to encrypt secure information transmitted over the internet.  A certificate can be generated or 		procured from a third party Certificate Authority (CA). The resource type for this feature is "cudawaf_certificate".
Generated certificates can be self-signed or signed by a trusted third-party CA. A certificate contains information such as user 	name, expiration date, a unique serial number assigned to the certificate by a trusted CA, the public key, and the name of the CA 	 that issued the certificate.

### Cloud-control
A comprehensive cloud-based service that enables administrators to monitor and configure multiple Barracuda Networks products from 	   a single console. The resource type for this feature is "cudawaf_cloudcontrol".

### Rule Group Server 
A rule group server object can be used to configure the networking information of the back-end server to be hosted on the 		Barracuda Web Application Firewall. Multiple real servers can be added and configured to load balance the incoming traffic for a 	 rule group. The resource type for this feature is “cudawaf_rule_group_server”.

### Rule Group
Rules are used to configure content-aware switching over incoming web traffic. Rules help analyze an HTTP request headers to make 	  load balancing and caching policy decisions. The resource type for this feature is “cudawaf_rule_group”.

### Security Policy
A Security Policy determines what action to take when one or more of the rules match the request. All security policies are global 	   and can be shared among multiple Services configured on the Barracuda Web Application Firewall. The resource type for this feature 	      is “cudawaf_security_policy".

The detailed documentation on each of these REST API end points can be found here : [Barracuda Web Application REST API v3](https://campus.barracuda.com/product/webapplicationfirewall/api)

## Setup

### Pre-Requisites

The following components are necessary to use this module:

  * A server running as a Puppet master.
  * A Puppet agent running as a Puppet Device proxy to the Barracuda WAF.
  * A Barracuda Web Application Firewall running the firmware version v9.1 or above

Set the Ruby Library Path with the following command:
  export RUBYLIB=/etc/puppetlabs/code/environments/<env name>/modules/cudawaf/lib/:$RUBYLIB , where "env name" is the name of the Puppet environment.

### To install the module
``` bash
puppet module install barracuda-cudawaf
```

### To install in a specific environment
``` bash
puppet module install barracuda-cudawaf --environment=<env-name>
```

### Installing the gem files on the Puppet Agent:
``` bash
/opt/puppetlabs/puppet/bin/gem install rest-client -v 1.8.0
/opt/puppetlabs/puppet/bin/gem install typhoeus

```
### Puppet Device
To use the module, first configure a Puppet agent that is able to run `puppet device`.
This agent will be used to act as a "proxy system" for the `puppet device` subcommand.

### Create a device.conf file on the Puppet Agent node:

Path and file name:

```bash
/etc/puppetlabs/puppet/device.conf

```

Example "device.conf" file

``` puppet
[waf-1]
   type cudawaf
   url http://admin:<password>@<ip_address>:8000/

```

### Command to run puppet device:

``` puppet
puppet device -v --user=root
```

## Usage Examples

### Create a HTTP service with a Rule Group and Rule group Server, and connect the WAF to the Barracuda Cloud Control

``` puppet

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

        cudawaf_cloudcontrol  {  'CloudControl':
          ensure            => present,
          state             => 'not_connected',
          connect_mode      => 'cloud',
          username          => 'user@domain.com',
          password          => 'password'
        }

        cudawaf_rule_group {  'RuleGroup-1':
          ensure            => present,
          name              => 'ContentRule1',
          service_name      => 'MyService2',
          url_match         => '/testing.html',
          host_match        => 'www.example.com'
        }

        cudawaf_rule_group_server  { 'RuleGroupServer-1':
          ensure        => absent,
          name          => 'rgServer1',
          service_name  => 'MyService2',
          rule_group_name => 'ContentRule1',
          identifier    => 'Hostname',
          hostname      => 'barracuda.com'
        }

```

### Creating Resources (Additional examples)
The following example manifests can be used to create resources on the Barracuda Web Application Firewall:

### To create a HTTP Service:
``` puppet
cudawaf_service { 'WAFSVC-1':
  ensure        => present,
  name          => 'WAFSERVICE',
  type          => 'http',
  mask          => '255.255.255.255',
  ip_address    => '10.0.0.1',
  port          => '80',
  group         => 'default',
  vsite         => 'default',
  status                => 'On',
  address_version       => 'ipv4',
  enable_access_logs => 'Yes',
  svcname => 'ProdService',
}
```
### To create a Real server:
``` puppet
cudawaf_server	 { 'WAFSERVER-2':
  ensure => present,
  name => 'server2',
  identifier=> 'IP Address',
  address_version => 'IPv4',
  status => 'In Service',
  ip_address => '192.168.1.10',
  service_name => 'ProdService',
  port => '80',
  comments => 'Server for ProdService',
}
```

### To Upload a Signed Certificate:
``` puppet
cudawaf_certificate { 'WAFUPLOADSIGNEDCER-1':
  ensure => present,
  name => 'signedcert1',
  signed_certificate => '/home/wafcertificates/root.pem',
  allow_private_key_export => 'yes',
  type => 'pem',
  key =>'/home/wafcertificates/privkey.pem',
  assign_associated_key => 'no',
  upload => 'signed'
}

```
### To Upload a Trusted Certificate:
``` puppet
cudawaf_certificate	{ 'WAFUPLOADTRUSTEDCER-1':
  ensure => present,
  name => 'trustedcert1',
  trusted_certificate => '/home/wafcertificates/cer.pem',
  upload => 'trusted'
}

```
### To Upload a Intermediary Signed Certificate:
``` puppet
cudawaf_certificate { 'WAFUPLOADINTERMEDIATESIGNEDCER-1':
  ensure => present,
  name => 'signedcertint1',
  signed_certificate => '/home/wafcertificates/root.pem',
  intermediary_certificate => '/home/wafcertificates/inter.pem',
  allow_private_key_export => 'no',
  type => 'pem',
  key =>'/home/wafcertificates/privkey.pem',
  assign_associated_key => 'no',
  upload => 'signed'
}

```
### To Upload a Trusted Server Certificate:
``` puppet
cudawaf_certificate { 'WAFUPLOADTRUSTEDSERVERCER-1':
  ensure => present,
  name => 'trustedservercert1',
  trusted_server_certificate => '/home/wafcertificates/cer.pem',
  upload => 'trusted_server'
}
```
### To connect the WAF to Barracuda Cloud Control
``` puppet
cudawaf_cloudcontrol { 'WAFCouldControl-1':
  ensure => present,
  connect_mode => 'cloud',
  state => 'connected',
  username => 'testmail@barracuda.com',
  password => 'password'
}
```
## Reference - An under-the-hood peek at what the module is doing and how

### `cudawaf_service`
A Virtual Service is a combination of a Virtual IP (VIP) address and a TCP port, which listens and directs the traffic to the intended Service.

### Service Parameters

#### `address-version`
Specifies the IP Protocol to be used with the service. Must be "IPv4",

#### `status`
Specifies if the service should be enabled "On" or disabled "Off"

#### `name`
Specifies the name for the service. Must be a valid string

#### `port`
Specifies the listening port for the service

#### `comments`
Specifies the description for the service

#### `enable-access-logs`
Specifies if the service should be created with the access logs enabled i.e "Yes" or disabled i.e "No"

#### `session-timeout`
Specifies the session idle timeout. Must be a valid number or 0

#### `app-id`
Specifies the app-id for the service

#### `group`
Specifies the service group in which the Service is to be created. Must be a group present in the WAF.

#### `vsite`
Specifies the vsite object in which the Service will be created.

#### `type`
Specifies the type of service to be created. Example: HTTP or HTTPS

#### `dps-enabled`
Specifies if the service should have Advanced DdoS Prevention service enabled i.e "Yes" or disabled i.e "No",

#### `ip-address`
Specifies the listening ip address for the service

#### `mask`
Specifies the subnet mask for the service

### `cudawaf_server`
A server object can be used to configure the networking information of the back-end server to be hosted on the Barracuda Web Application Firewall. Multiple real servers can be added and configured to load balance the incoming traffic for a Service.

### Server Parameters

#### `identifier`
Specifies if the server identifier should be an ip address i.e "IP Address" or a hostname i.e "hostname"

#### `address-version`
Specifies IP Protocol. Must be IPv4

#### `status`
Specifies if the real server should be enabled or disabled. Must be set as one of In Service, Out of Service Maintenance, Out of Service Sticky, Out of Service All

#### `name`
Specifies the name for the server

#### `ip-address`
Specifies the ip address for the server. Must be set if the identifier is set as "IP Address"

#### `hostname`
Specifies the hostname for the server. Must be set if the identifier is set as "hostname"

#### `port`
Specifies the port number to be bound with the server

#### `comments`
Specifies a description for the server

### `cudawaf_certificate`

### Signed Certificate Parameters
#### `upload`
The certificate file to be uploaded should be specified with the path

#### `name`
Specifies the name for the certificate

#### `type`
Specifies the type for the certificate. Options are pkcs12 and pem

#### `key_type`
Specifies the key type for the certificate being uploaded

#### `signed_certificate`
Specifies the signed certificate file

#### `assign_associated_key`
Specifies if the uploaded certificate should be associates with a private key that is stored on the WAF system

#### `key`
Specifies the private key file

#### `intermediary_certificate`
Specifies the intermediary certificate to be used with the signed certificate during the upload

#### `allow_private_key_export`
Specifies if the WAF should allow the private key is to be exported when the certificate is exported

#### `password`
Specifies the password for the pkcs12 certificate


### Trusted Server Certificate Parameters

#### `upload`
The certificate file to be uploaded should be specified with the path

#### `name`
Specifies the name for the certificate

#### `trusted_server_certificate`
Specifies the trusted server certificate file


### Trusted CA Certificate Parameters

#### `upload`
The certificate file to be uploaded should be specified with the path

#### `name`
Specifies the name for the certificate

#### `trusted_certificate`
The certificate file to be uploaded should be specified with the path



### Self Signed Certificate Parameters
```
city:
common_name:
country_code:
curve_type:
key_size:
key_type:
name:
organization_name:
organization_unit:
san_certificate[
  "DNS:<domain name>,"
  "Email:<email address>,"
  "URI:<Provide the URI.>",
  "IP:<Provide the IP.>"
]
state:

```

### `cudawaf_cloudcontrol`

### Barracuda Cloud Control Parameters

#### `connect_mode`
Specifies the mode of connections. Must be "cloud"

#### `password`
Specifies the password to be used for the cloud control connection. This should be available before using this resource type.

#### `state`
Specifies the state of the connection

#### `username`
Specifies the Barracuda Cloud Control username for the connection. This should be available before using this resource type.

### `cudawaf_security_policy`

### Security Policy Parameters

#### `name`
Specifies the name for the security policy

### `cudawaf_rule_group`

### Rule Group Parameters

#### `name`
Specifies the name for the rule group

#### `service_name`
Specifies the name of the service under which the rule group should be created

#### `app_id`
Specifies the app id for the rule group

#### `comments`
Specifies any user comments under the rule group created

#### `extended_match`
Specifies the extended match to be used with the rule group for matching the incoming request

#### `extended_match_sequence`
Specifies the extended match sequence number for the rule

#### `host_match`
Specifies the host header match for the rule group

#### `mode`
Specifies the security policy mode for the rule group

#### `status`
Specifies if the rule group is enabled or disabled

#### `url_match`
Specifies the url match for the rule group

#### `web_firewall_policy`
Specifies the security policy for the rule group


### `cudawaf_rule_group_server`

### Rule Group Server Parameters

#### `name`
Specifies the name for the rule group server
#### `identifier`
Specifies if the server identifier should be an ip address i.e "IP Address" or a hostname i.e "hostname"

#### `address-version`
Specifies IP Protocol. Must be IPv4

#### `status`
Specifies if the real server should be enabled or disabled. Must be set as one of In Service, Out of Service Maintenance, Out of Service Sticky, Out of Service All

#### `name`
Specifies the name for the server

#### `ip-address`
Specifies the ip address for the server. Must be set if the identifier is set as "IP Address"

#### `hostname`
Specifies the hostname for the server. Must be set if the identifier is set as "hostname"

#### `port`
Specifies the port number to be bound with the server

#### `comments`
Specifies a description for the server

#### `rule_group_name`
Specifies the name of the rule group under which the server has to be created

#### `service_name`
Specifies the name of the service

#### `backup_server`
Specifies the ip address of the backup server if the primary server is not reachable

#### `identifier`
Specifies the identifier for the server. Mention "IP Address" or "Hostname"

#### `hostname`
Specifies the hostname if the identifier is set to Hostname

#### `weight`
Specifies the weight for the rule group server


## Limitations

This module is intended to be supported on [all PE-supported platforms](https://forge.puppetlabs.com/supported#compat-matrix). However, it has been currently tested on Ubuntu/Linux platforms only.

## Development

Barracuda modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. Please follow our guidelines when contributing changes.

For more information, see our [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)

### Contributors

To see who's already involved, see the [list of contributors.](https://github.com/barracudanetworks/barracuda-cudawaf/graphs/contributors)


##### DISCLAIMER: ALL OF THE SOURCE CODE ON THIS REPOSITORY IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL BARRACUDA BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOURCE CODE.
