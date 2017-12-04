# SwaggerClient::SslSecurityBody

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**ciphers** | **String** | Ciphers | [optional] [default to &quot;Default&quot;]
**enable_sni** | **String** | Enable SNI | [optional] [default to &quot;No&quot;]
**status** | **String** | Status | [optional] [default to &quot;Off&quot;]
**secure_site_domain** | **String** | Secure Site Domain | [optional] 
**certificate** | **String** | Certificate | [optional] 
**hsts_max_age** | **Integer** | Enter HSTS Max-Age | [optional] 
**sni_certificate** | **String** | Domain Certificate | [optional] 
**enable_strict_sni_check** | **String** | Enable Strict SNI Check | [optional] [default to &quot;No&quot;]
**ecdsa_certificate** | **String** | ECDSA Certificate | [optional] 
**domain** | **String** | Domain | [optional] 
**enable_ssl_3** | **String** | SSL 3.0 | [optional] [default to &quot;No&quot;]
**enable_tls_1_1** | **String** | TLS 1.1 | [optional] [default to &quot;Yes&quot;]
**enable_hsts** | **String** | Enable HSTS | [optional] [default to &quot;No&quot;]
**enable_tls_1_2** | **String** | TLS 1.2 | [optional] [default to &quot;Yes&quot;]
**include_hsts_sub_domains** | **String** | Include HSTS Sub-Domains | [optional] [default to &quot;No&quot;]
**sni_ecdsa_certificate** | **String** | Domain ECDSA Certificate | [optional] 
**selected_ciphers** | **String** |  | [optional] [default to &quot;ECDHE-ECDSA-AES256-GCM-SHA384,ECDHE-RSA-AES256-GCM-SHA384,ECDHE-ECDSA-AES128-GCM-SHA256,ECDHE-RSA-AES128-GCM-SHA256,ECDHE-ECDSA-AES256-SHA384,ECDHE-RSA-AES256-SHA384,ECDHE-ECDSA-AES128-SHA256,ECDHE-RSA-AES128-SHA256,AES256-GCM-SHA384,AES128-GCM-SHA256,AES256-SHA256,AES128-SHA256,ECDHE-ECDSA-AES256-SHA,ECDHE-RSA-AES256-SHA,ECDHE-ECDSA-DES-CBC3-SHA,ECDHE-RSA-DES-CBC3-SHA,ECDHE-ECDSA-AES128-SHA,ECDHE-RSA-AES128-SHA,AES256-SHA,DHE-RSA-AES256-GCM-SHA384,DHE-RSA-AES256-SHA256,DHE-RSA-AES256-SHA,DHE-RSA-CAMELLIA256-SHA,DHE-RSA-AES128-GCM-SHA256,DHE-RSA-AES128-SHA256,DHE-RSA-AES128-SHA,DHE-RSA-CAMELLIA128-SHA,EDH-RSA-DES-CBC3-SHA,CAMELLIA256-SHA,DES-CBC3-SHA,AES128-SHA,CAMELLIA128-SHA&quot;]
**enable_pfs** | **String** | Enable Perfect Forward Secrecy | [optional] [default to &quot;No&quot;]
**enable_tls_1** | **String** | TLS 1.0 (Insecure) | [optional] [default to &quot;No&quot;]


