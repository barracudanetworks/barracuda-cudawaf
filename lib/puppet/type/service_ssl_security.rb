Puppet::Type.newtype(:service_ssl_security) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:ciphers) do
    desc "Ciphers"
    defaultto :Default
    newvalues(:Default, :Custom)
  end


  newproperty(:enable_sni) do
    desc "Enable SNI"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:certificate) do
    desc "Certificate"
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:hsts_max_age) do
    desc "Enter HSTS Max-Age"
    defaultto 365
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid hsts_max_age #{value}, Must not be lesser than 0") if value < 0
    end
  end


  newproperty(:enable_strict_sni_check) do
    desc "Enable Strict SNI Check"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:sni_certificate) do
    desc "Domain Certificate"
  end


  newproperty(:ecdsa_certificate) do
    desc "ECDSA Certificate"
  end


  newproperty(:domain) do
    desc "Domain"
  end


  newproperty(:override_ciphers_ssl3) do
    desc ""
  end


  newproperty(:override_ciphers_tls_1) do
    desc ""
  end


  newproperty(:override_ciphers_tls_1_1) do
    desc ""
  end


  newproperty(:enable_ssl_3) do
    desc "SSL 3.0"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_tls_1_1) do
    desc "TLS 1.1"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:enable_hsts) do
    desc "Enable HSTS"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_tls_1_2) do
    desc "TLS 1.2"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:include_hsts_sub_domains) do
    desc "Include HSTS Sub-Domains"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:selected_ciphers) do
    desc "Selected Ciphers"
    defaultto :ECDHE-ECDSA-AES256-GCM-SHA384,ECDHE-RSA-AES256-GCM-SHA384,ECDHE-ECDSA-AES128-GCM-SHA256,ECDHE-RSA-AES128-GCM-SHA256,ECDHE-ECDSA-AES256-SHA384,ECDHE-RSA-AES256-SHA384,ECDHE-ECDSA-AES128-SHA256,ECDHE-RSA-AES128-SHA256,AES256-GCM-SHA384,AES128-GCM-SHA256,AES256-SHA256,AES128-SHA256,ECDHE-ECDSA-AES256-SHA,ECDHE-RSA-AES256-SHA,ECDHE-ECDSA-DES-CBC3-SHA,ECDHE-RSA-DES-CBC3-SHA,ECDHE-ECDSA-AES128-SHA,ECDHE-RSA-AES128-SHA,AES256-SHA,DHE-RSA-AES256-GCM-SHA384,DHE-RSA-AES256-SHA256,DHE-RSA-AES256-SHA,DHE-RSA-CAMELLIA256-SHA,DHE-RSA-AES128-GCM-SHA256,DHE-RSA-AES128-SHA256,DHE-RSA-AES128-SHA,DHE-RSA-CAMELLIA128-SHA,EDH-RSA-DES-CBC3-SHA,CAMELLIA256-SHA,DES-CBC3-SHA,AES128-SHA,CAMELLIA128-SHA
  end


  newproperty(:sni_ecdsa_certificate) do
    desc "Domain ECDSA Certificate"
  end


  newproperty(:enable_pfs) do
    desc "Enable Perfect Forward Secrecy"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:enable_tls_1) do
    desc "TLS 1.0 (Insecure)"
    defaultto :No
    newvalues(:Yes, :No)
  end


end
