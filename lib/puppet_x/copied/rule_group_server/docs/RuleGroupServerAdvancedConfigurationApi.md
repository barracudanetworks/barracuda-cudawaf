# SwaggerClient::RuleGroupServerAdvancedConfigurationApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_get**](RuleGroupServerAdvancedConfigurationApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_get) | **GET** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name}/advanced-configuration | FETCH Information of Rule Group Server advanced configuration
[**services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_put**](RuleGroupServerAdvancedConfigurationApi.md#services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_put) | **PUT** /services/{Web Application Name}/content-rules/{Rule Group Name}/content-rule-servers/{Web Server Name}/advanced-configuration  | EDIT Information of Rule Group Server advanced configuration


# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_get**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_get(authorization, web_application_name, rule_group_name, web_server_name, opts)

FETCH Information of Rule Group Server advanced configuration



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerAdvancedConfigurationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server advanced configuration

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server advanced configuration

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server advanced configuration

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Rule Group Server advanced configuration
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_get(authorization, web_application_name, rule_group_name, web_server_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerAdvancedConfigurationApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server advanced configuration | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server advanced configuration | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server advanced configuration | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_put**
> services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_put(authorization, web_application_name, rule_group_name, web_server_name, rule_group_server_advanced_configuration)

EDIT Information of Rule Group Server advanced configuration



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RuleGroupServerAdvancedConfigurationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Rule Group Server advanced configuration

rule_group_name = "rule_group_name_example" # String | Rule Group Name of Rule Group Server advanced configuration

web_server_name = "web_server_name_example" # String | Web Server Name of Rule Group Server advanced configuration

rule_group_server_advanced_configuration = SwaggerClient::RuleGroupServerAdvancedConfigurationBody.new # RuleGroupServerAdvancedConfigurationBody | Body Parameter of Rule Group Server advanced configuration


begin
  #EDIT Information of Rule Group Server advanced configuration
  api_instance.services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_put(authorization, web_application_name, rule_group_name, web_server_name, rule_group_server_advanced_configuration)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RuleGroupServerAdvancedConfigurationApi->services_web_application_name_content_rules_rule_group_name_content_rule_servers_web_server_name_advanced_configuration_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Rule Group Server advanced configuration | 
 **rule_group_name** | **String**| Rule Group Name of Rule Group Server advanced configuration | 
 **web_server_name** | **String**| Web Server Name of Rule Group Server advanced configuration | 
 **rule_group_server_advanced_configuration** | [**RuleGroupServerAdvancedConfigurationBody**](RuleGroupServerAdvancedConfigurationBody.md)| Body Parameter of Rule Group Server advanced configuration | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



