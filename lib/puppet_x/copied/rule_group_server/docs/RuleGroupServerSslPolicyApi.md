# SwaggerClient::RuleGroupServerSslPolicyApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_get**](RuleGroupServerSslPolicyApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_get) | **GET** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name}/ssl-policy | FETCH Information of Rule Group Server ssl policy
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_put**](RuleGroupServerSslPolicyApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_put) | **PUT** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name}/ssl-policy  | EDIT Information of Rule Group Server ssl policy


# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_get**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_get(authorization, web_application_name, rule_group_name, web_server_name, opts)

FETCH Information of Rule Group Server ssl policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerSslPolicyApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server ssl policy

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server ssl policy

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server ssl policy

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Rule Group Server ssl policy
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_get(authorization, web_application_name, rule_group_name, web_server_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerSslPolicyApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server ssl policy | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server ssl policy | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server ssl policy | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_put**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_put(authorization, web_application_name, rule_group_name, web_server_name, rule_group_server_ssl_policy)

EDIT Information of Rule Group Server ssl policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerSslPolicyApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server ssl policy

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server ssl policy

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server ssl policy

rule_group_server_ssl_policy = SwaggerClient::RuleGroupServerSslPolicyBody.new # RuleGroupServerSslPolicyBody | Body Parameter of Rule Group Server ssl policy


begin
  #EDIT Information of Rule Group Server ssl policy
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_put(authorization, web_application_name, rule_group_name, web_server_name, rule_group_server_ssl_policy)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerSslPolicyApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_ssl_policy_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server ssl policy | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server ssl policy | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server ssl policy | 
 **rule_group_server_ssl_policy** | [**RuleGroupServerSslPolicyBody**](RuleGroupServerSslPolicyBody.md)| Body Parameter of Rule Group Server ssl policy | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



