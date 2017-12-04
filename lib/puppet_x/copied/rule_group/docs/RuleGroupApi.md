# SwaggerClient::RuleGroupApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_content_rules_get**](RuleGroupApi.md#services_web_application_name_content_rules_get) | **GET** /services/{Web Application Name}/content-rules  | FETCH Information of Rule Group
[**services_web_application_name_content_rules_post**](RuleGroupApi.md#services_web_application_name_content_rules_post) | **POST** /services/{Web Application Name}/content-rules | ADD Information of Rule Group
[**services_web_application_name_content_rules_rule_group_name_delete**](RuleGroupApi.md#services_web_application_name_content_rules_rule_group_name_delete) | **DELETE** /services/{Web Application Name}/content-rules/{Rule Group Name} | DELETE Information of Rule Group
[**services_web_application_name_content_rules_rule_group_name_get**](RuleGroupApi.md#services_web_application_name_content_rules_rule_group_name_get) | **GET** /services/{Web Application Name}/content-rules/{Rule Group Name}  | FETCH Information of Rule Group
[**services_web_application_name_content_rules_rule_group_name_put**](RuleGroupApi.md#services_web_application_name_content_rules_rule_group_name_put) | **PUT** /services/{Web Application Name}/content-rules/{Rule Group Name}   | EDIT Information of Rule Group


# **services_web_application_name_content_rules_get**
> services_web_application_name_content_rules_get(authorization, web_application_name, opts)

FETCH Information of Rule Group



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Rule Group
  api_instance.services_web_application_name_content_rules_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupApi->services_web_application_name_content_rules_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_post**
> services_web_application_name_content_rules_post(authorization, web_application_name, rule_group)

ADD Information of Rule Group



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group

rule_group = SwaggerClient::RuleGroupBody.new # RuleGroupBody | Body Parameter of Rule Group


begin
  #ADD Information of Rule Group
  api_instance.services_web_application_name_content_rules_post(authorization, web_application_name, rule_group)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupApi->services_web_application_name_content_rules_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group | 
 **rule_group** | [**RuleGroupBody**](RuleGroupBody.md)| Body Parameter of Rule Group | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_delete**
> services_web_application_name_content_rules_rule_group_name_delete(authorization, web_application_name, rule_group_name)

DELETE Information of Rule Group



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group


begin
  #DELETE Information of Rule Group
  api_instance.services_web_application_name_content_rules_rule_group_name_delete(authorization, web_application_name, rule_group_name)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupApi->services_web_application_name_content_rules_rule_group_name_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_get**
> services_web_application_name_content_rules_rule_group_name_get(authorization, web_application_name, rule_group_name, opts)

FETCH Information of Rule Group



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Rule Group
  api_instance.services_web_application_name_content_rules_rule_group_name_get(authorization, web_application_name, rule_group_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupApi->services_web_application_name_content_rules_rule_group_name_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_put**
> services_web_application_name_content_rules_rule_group_name_put(authorization, web_application_name, rule_group_name, rule_group)

EDIT Information of Rule Group



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group

rule_group = SwaggerClient::RuleGroupBody.new # RuleGroupBody | Body Parameter of Rule Group


begin
  #EDIT Information of Rule Group
  api_instance.services_web_application_name_content_rules_rule_group_name_put(authorization, web_application_name, rule_group_name, rule_group)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupApi->services_web_application_name_content_rules_rule_group_name_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group | 
 **rule_group** | [**RuleGroupBody**](RuleGroupBody.md)| Body Parameter of Rule Group | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



