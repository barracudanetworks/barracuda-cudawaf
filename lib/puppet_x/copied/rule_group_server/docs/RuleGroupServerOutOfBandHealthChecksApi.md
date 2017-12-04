# SwaggerClient::RuleGroupServerOutOfBandHealthChecksApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_get**](RuleGroupServerOutOfBandHealthChecksApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_get) | **GET** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name}/out-of-band-health-checks | FETCH Information of Rule Group Server out of band health checks
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_put**](RuleGroupServerOutOfBandHealthChecksApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_put) | **PUT** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name}/out-of-band-health-checks  | EDIT Information of Rule Group Server out of band health checks


# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_get**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_get(authorization, web_application_name, rule_group_name, web_server_name, opts)

FETCH Information of Rule Group Server out of band health checks



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerOutOfBandHealthChecksApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server out of band health checks

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server out of band health checks

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server out of band health checks

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Rule Group Server out of band health checks
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_get(authorization, web_application_name, rule_group_name, web_server_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerOutOfBandHealthChecksApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server out of band health checks | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server out of band health checks | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server out of band health checks | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_put**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_put(authorization, web_application_name, rule_group_name, web_server_name, rule_group_server_out_of_band_health_checks)

EDIT Information of Rule Group Server out of band health checks



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerOutOfBandHealthChecksApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server out of band health checks

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server out of band health checks

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server out of band health checks

rule_group_server_out_of_band_health_checks = SwaggerClient::RuleGroupServerOutOfBandHealthChecksBody.new # RuleGroupServerOutOfBandHealthChecksBody | Body Parameter of Rule Group Server out of band health checks


begin
  #EDIT Information of Rule Group Server out of band health checks
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_put(authorization, web_application_name, rule_group_name, web_server_name, rule_group_server_out_of_band_health_checks)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerOutOfBandHealthChecksApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_out_of_band_health_checks_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server out of band health checks | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server out of band health checks | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server out of band health checks | 
 **rule_group_server_out_of_band_health_checks** | [**RuleGroupServerOutOfBandHealthChecksBody**](RuleGroupServerOutOfBandHealthChecksBody.md)| Body Parameter of Rule Group Server out of band health checks | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



