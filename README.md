
### Table of Contents

1. [Description](#description)
2. [Types](#resource-types)
2. [Setup - The basics of getting started with cudawaf](#setup)
3. [Usage - Configuration options and additional functionality](#usage-examples)
4. [Reference - An under-the-hood peek at what the module is doing and how](reference---an-under-the-hood-peek-at-what-the-module-is-doing-and-how)
  * [Service](#service)
  * [Server](#server)
  * [Certificates](#certificates)
  * [Cloud Control](#cloud-control)


## Description

With the Barracuda Web Application Firewall, administrators do not need to wait for clean code or even know how an application works to secure their applications. Organizations can ensure robust security with a Barracuda Web Application Firewall hardware or virtual appliance, deployed either on-premises or in the cloud.
This module enables management of the Barracuda Web Application Firewall using Puppet.

## Resource Types

The following features can be configured using this module:

1. `Service` - A Virtual Service is a combination of a Virtual IP (VIP) address and a TCP port, which listens and directs the traffic to the intended Service.


2. `Server` - A server object can be used to configure the networking information of the back-end server to be hosted on the Barracuda Web Application Firewall. Multiple real servers can be added and configured to load balance the incoming traffic for a Service.

3. `Certificates` - A signed certificate is a digital identity document that enables both server and client to authenticate each other.  Certificates are used with HTTPS protocol to encrypt secure information transmitted over the internet.  A certificate can be generated or procured from a third party Certificate Authority (CA).

Generated certificates can be self-signed or signed by a trusted third-party CA. A certificate contains information such as user name, expiration date, a unique serial number assigned to the certificate by a trusted CA, the public key, and the name of the CA that issued the certificate.

4. `Cloud-control` - A comprehensive cloud-based service that enables administrators to monitor and configure multiple Barracuda Networks products from a single console.

The detailed documentation on each of these REST API end points can be found here : [Barracuda Web Application REST API v3](https://campus.barracuda.com/product/webapplicationfirewall/api)

## Setup

### Pre-Requisites

The following components are necessary to use this module:

  * A server running as a Puppet master.
  * A Puppet agent running as a controller to the Barracuda WAF.
  * A Barracuda Web Application Firewall running the firmware version v9.1 or above


### To install the module
``` bash
puppet module install puppetlabs-cudawaf
```

### To install in a specific environment
``` bash
puppet module install puppetlabs-cudawaf --environment=<env-name>
```

### Installing the gem files on the Puppet Agent node:
``` bash
/opt/puppetlabs/puppet/bin/gem install typoheus
/opt/puppetlabs/puppet/bin/gem install rest-client
```
### Create a credentials file on the Puppet Agent node:

Path ```/etc/puppetlabs/puppet/credentials.json```

Example "credentials.json"

```
{
  "username":"admin",
  "password":"admin"
}
```

## Usage Examples

### Creating Resources
The following example manifests can be used to create resources on the Barracuda Web Application Firewall:

### To create a HTTP Service:
``` puppet
wafservices  { 'WAFSVC-1':
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
wafservers { 'WAFSERVER-2':
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
wafcertificates { 'WAFUPLOADSIGNEDCER-1':
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
wafcertificates { 'WAFUPLOADTRUSTEDCER-1':
  ensure => present,
  name => 'trustedcert1',
  trusted_certificate => '/home/wafcertificates/cer.pem',
  upload => 'trusted'
}

```
### To Upload a Intermediary Signed Certificate:
``` puppet
wafcertificates { 'WAFUPLOADINTERMEDIATESIGNEDCER-1':
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
wafcertificates { 'WAFUPLOADTRUSTEDSERVERCER-1':
  ensure => present,
  name => 'trustedservercert1',
  trusted_server_certificate => '/home/wafcertificates/cer.pem',
  upload => 'trusted_server'
}
```
### To connect the WAF to Barracuda Cloud Control
``` puppet
wafcloudcontrol { 'WAFCouldControl-1':
  ensure => present,
  connect_mode => 'cloud',
  state => 'connected',
  username => 'testmail@barracuda.com',
  password => 'password'
}
```
## Reference - An under-the-hood peek at what the module is doing and how

### `Service`
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

### `Server`
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

### `Certificates`

### Signed Certificate Parameters
#### `upload`
#### `name`
#### `type`
#### `key_type`
#### `signed_certificate`
#### `assign_associated_key`
#### `key`
#### `intermediary_certificate`
#### `allow_private_key_export`
#### `password`

### Trusted Server Certificate Parameters
#### `upload`
#### `name`
#### `trusted_server_certificate`

### Trusted CA Certificate Parameters
#### `upload`
#### `name`
#### `trusted_certificate`

### Self Signed Certificate Parameters
#### `allow_private_key_export` "yes",
#### `city` "string",
#### `common_name` "string",
#### `country_code` "string",
#### `curve_type` "secp256r1",
#### `key_size` "1024",
#### `key_type`: "rsa",
#### `name`: "string",
#### `organization_name`: "string",
#### `organization_unit`: "string",

#### `san_certificate[`
####    `"DNS:<Provide the DNS domain name.>",`
####    `"Email:<Provide the Email.>",`
####    `"URI:<Provide the URI.>",`
####    `"IP:<Provide the IP.>"`
####  `]`

#### `state`: "string"

### `Cloud Control`

### Barracuda Cloud Control Parameters

#### `connect_mode`
Specifies the mode of connections. Must be "cloud"

#### `password`
Specifies the password to be used for the cloud control connection. This should be available before using this resource type.

#### `state`
Specifies the state of the connection

#### `username`
Specifies the Barracuda Cloud Control username for the connection. This should be available before using this resource type.
