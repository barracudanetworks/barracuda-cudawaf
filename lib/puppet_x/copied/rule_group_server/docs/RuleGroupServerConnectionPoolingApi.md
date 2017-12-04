# SwaggerClient::RuleGroupServerConnectionPoolingApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_get**](RuleGroupServerConnectionPoolingApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_get) | **GET** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name}/connection-pooling | FETCH Information of Rule Group Server connection pooling
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_put**](RuleGroupServerConnectionPoolingApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_put) | **PUT** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name}/connection-pooling  | EDIT Information of Rule Group Server connection pooling


# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_get**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_get(authorization, web_application_name, rule_group_name, web_server_name, opts)

FETCH Information of Rule Group Server connection pooling



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerConnectionPoolingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server connection pooling

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server connection pooling

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server connection pooling

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Rule Group Server connection pooling
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_get(authorization, web_application_name, rule_group_name, web_server_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerConnectionPoolingApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server connection pooling | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server connection pooling | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server connection pooling | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_put**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_put(authorization, web_application_name, rule_group_name, web_server_name, rule_group_server_connection_pooling)

EDIT Information of Rule Group Server connection pooling



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerConnectionPoolingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server connection pooling

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server connection pooling

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server connection pooling

rule_group_server_connection_pooling = SwaggerClient::RuleGroupServerConnectionPoolingBody.new # RuleGroupServerConnectionPoolingBody | Body Parameter of Rule Group Server connection pooling


begin
  #EDIT Information of Rule Group Server connection pooling
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_put(authorization, web_application_name, rule_group_name, web_server_name, rule_group_server_connection_pooling)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerConnectionPoolingApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_connection_pooling_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server connection pooling | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server connection pooling | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server connection pooling | 
 **rule_group_server_connection_pooling** | [**RuleGroupServerConnectionPoolingBody**](RuleGroupServerConnectionPoolingBody.md)| Body Parameter of Rule Group Server connection pooling | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



