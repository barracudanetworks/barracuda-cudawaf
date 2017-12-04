# SwaggerClient::LoadBalancingBody

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**persistence_cookie_domain** | **String** | Persistence Cookie Domain | [optional] 
**algorithm** | **String** | Algorithm | [optional] [default to &quot;Round Robin&quot;]
**source_ip_netmask** | **String** | Source IP | [optional] 
**persistence_method** | **String** | Persistence Method | [optional] [default to &quot;None&quot;]
**cookie_age** | **Integer** | Cookie Age | [optional] 
**persistence_idle_timeout** | **Integer** | Idle Timeout | [optional] 
**persistence_cookie_name** | **String** | Persistence Cookie Name | [optional] [default to &quot;persistence&quot;]
**persistence_cookie_path** | **String** | Persistence Cookie Path | [optional] [default to &quot;/&quot;]
**parameter_name** | **String** | Parameter Name | [optional] 
**failover_method** | **String** | Failover Method | [optional] [default to &quot;Load Balance&quot;]
**header_name** | **String** | Header Name | [optional] 


