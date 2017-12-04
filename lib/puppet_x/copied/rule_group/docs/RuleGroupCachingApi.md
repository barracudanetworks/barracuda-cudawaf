# SwaggerClient::RuleGroupCachingApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_content_rules_rule_group_name_caching_get**](RuleGroupCachingApi.md#services_web_application_name_content_rules_rule_group_name_caching_get) | **GET** /services/{Web Application Name}/content-rules/{Rule Group Name}/caching | FETCH Information of Rule Group caching
[**services_web_application_name_content_rules_rule_group_name_caching_put**](RuleGroupCachingApi.md#services_web_application_name_content_rules_rule_group_name_caching_put) | **PUT** /services/{Web Application Name}/content-rules/{Rule Group Name}/caching  | EDIT Information of Rule Group caching


# **services_web_application_name_content_rules_rule_group_name_caching_get**
> services_web_application_name_content_rules_rule_group_name_caching_get(authorization, web_application_name, rule_group_name, opts)

FETCH Information of Rule Group caching



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupCachingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group caching

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group caching

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Rule Group caching
  api_instance.services_web_application_name_content_rules_rule_group_name_caching_get(authorization, web_application_name, rule_group_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupCachingApi->services_web_application_name_content_rules_rule_group_name_caching_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group caching | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group caching | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_caching_put**
> services_web_application_name_content_rules_rule_group_name_caching_put(authorization, web_application_name, rule_group_name, rule_group_caching)

EDIT Information of Rule Group caching



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupCachingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group caching

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group caching

rule_group_caching = SwaggerClient::RuleGroupCachingBody.new # RuleGroupCachingBody | Body Parameter of Rule Group caching


begin
  #EDIT Information of Rule Group caching
  api_instance.services_web_application_name_content_rules_rule_group_name_caching_put(authorization, web_application_name, rule_group_name, rule_group_caching)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupCachingApi->services_web_application_name_content_rules_rule_group_name_caching_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group caching | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group caching | 
 **rule_group_caching** | [**RuleGroupCachingBody**](RuleGroupCachingBody.md)| Body Parameter of Rule Group caching | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



