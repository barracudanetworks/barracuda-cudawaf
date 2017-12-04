# SwaggerClient::RuleGroupServerApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_get**](RuleGroupServerApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_get) | **GET** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers  | FETCH Information of Rule Group Server
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_post**](RuleGroupServerApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_post) | **POST** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers | ADD Information of Rule Group Server
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_delete**](RuleGroupServerApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_delete) | **DELETE** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name} | DELETE Information of Rule Group Server
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_get**](RuleGroupServerApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_get) | **GET** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name}   | FETCH Information of Rule Group Server
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_put**](RuleGroupServerApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_put) | **PUT** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name}  | EDIT Information of Rule Group Server


# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_get**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_get(authorization, web_application_name, rule_group_name, opts)

FETCH Information of Rule Group Server



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Rule Group Server
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_get(authorization, web_application_name, rule_group_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_post**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_post(authorization, web_application_name, rule_group_name, rule_group_server)

ADD Information of Rule Group Server



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server

rule_group_server = SwaggerClient::RuleGroupServerBody.new # RuleGroupServerBody | Body Parameter of Rule Group Server


begin
  #ADD Information of Rule Group Server
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_post(authorization, web_application_name, rule_group_name, rule_group_server)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server | 
 **rule_group_server** | [**RuleGroupServerBody**](RuleGroupServerBody.md)| Body Parameter of Rule Group Server | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_delete**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_delete(authorization, web_application_name, rule_group_name, web_server_name)

DELETE Information of Rule Group Server



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server


begin
  #DELETE Information of Rule Group Server
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_delete(authorization, web_application_name, rule_group_name, web_server_name)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_get**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_get(authorization, web_application_name, rule_group_name, web_server_name, opts)

FETCH Information of Rule Group Server



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Rule Group Server
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_get(authorization, web_application_name, rule_group_name, web_server_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_put**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_put(authorization, web_application_name, rule_group_name, web_server_name, rule_group_server)

EDIT Information of Rule Group Server



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server

rule_group_server = SwaggerClient::RuleGroupServerBody.new # RuleGroupServerBody | Body Parameter of Rule Group Server


begin
  #EDIT Information of Rule Group Server
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_put(authorization, web_application_name, rule_group_name, web_server_name, rule_group_server)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server | 
 **rule_group_server** | [**RuleGroupServerBody**](RuleGroupServerBody.md)| Body Parameter of Rule Group Server | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



