# SwaggerClient::RuleGroupCompressionApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_content_rules_rule_group_name_compression_get**](RuleGroupCompressionApi.md#services_web_application_name_content_rules_rule_group_name_compression_get) | **GET** /services/{Web Application Name}/content-rules/{Rule Group Name}/compression | FETCH Information of Rule Group compression
[**services_web_application_name_content_rules_rule_group_name_compression_put**](RuleGroupCompressionApi.md#services_web_application_name_content_rules_rule_group_name_compression_put) | **PUT** /services/{Web Application Name}/content-rules/{Rule Group Name}/compression  | EDIT Information of Rule Group compression


# **services_web_application_name_content_rules_rule_group_name_compression_get**
> services_web_application_name_content_rules_rule_group_name_compression_get(authorization, web_application_name, rule_group_name, opts)

FETCH Information of Rule Group compression



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupCompressionApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group compression

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group compression

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Rule Group compression
  api_instance.services_web_application_name_content_rules_rule_group_name_compression_get(authorization, web_application_name, rule_group_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupCompressionApi->services_web_application_name_content_rules_rule_group_name_compression_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group compression | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group compression | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_compression_put**
> services_web_application_name_content_rules_rule_group_name_compression_put(authorization, web_application_name, rule_group_name, rule_group_compression)

EDIT Information of Rule Group compression



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupCompressionApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group compression

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group compression

rule_group_compression = SwaggerClient::RuleGroupCompressionBody.new # RuleGroupCompressionBody | Body Parameter of Rule Group compression


begin
  #EDIT Information of Rule Group compression
  api_instance.services_web_application_name_content_rules_rule_group_name_compression_put(authorization, web_application_name, rule_group_name, rule_group_compression)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupCompressionApi->services_web_application_name_content_rules_rule_group_name_compression_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group compression | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group compression | 
 **rule_group_compression** | [**RuleGroupCompressionBody**](RuleGroupCompressionBody.md)| Body Parameter of Rule Group compression | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



