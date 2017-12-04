# SwaggerClient::AdvancedConfigurationApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_advanced_configuration_get**](AdvancedConfigurationApi.md#services_web_application_name_advanced_configuration_get) | **GET** /services/{Web Application Name}/advanced-configuration  | FETCH Information of advanced configuration
[**services_web_application_name_advanced_configuration_post**](AdvancedConfigurationApi.md#services_web_application_name_advanced_configuration_post) | **POST** /services/{Web Application Name}/advanced-configuration | ADD Information of advanced configuration
[**services_web_application_name_advanced_configuration_put**](AdvancedConfigurationApi.md#services_web_application_name_advanced_configuration_put) | **PUT** /services/{Web Application Name}/advanced-configuration   | EDIT Information of advanced configuration


# **services_web_application_name_advanced_configuration_get**
> services_web_application_name_advanced_configuration_get(authorization, web_application_name, opts)

FETCH Information of advanced configuration



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::AdvancedConfigurationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of advanced configuration

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of advanced configuration
  api_instance.services_web_application_name_advanced_configuration_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AdvancedConfigurationApi->services_web_application_name_advanced_configuration_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of advanced configuration | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_advanced_configuration_post**
> services_web_application_name_advanced_configuration_post(authorization, web_application_name, advanced_configuration)

ADD Information of advanced configuration



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::AdvancedConfigurationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of advanced configuration

advanced_configuration = SwaggerClient::AdvancedConfigurationBody.new # AdvancedConfigurationBody | Body Parameter of advanced configuration


begin
  #ADD Information of advanced configuration
  api_instance.services_web_application_name_advanced_configuration_post(authorization, web_application_name, advanced_configuration)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AdvancedConfigurationApi->services_web_application_name_advanced_configuration_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of advanced configuration | 
 **advanced_configuration** | [**AdvancedConfigurationBody**](AdvancedConfigurationBody.md)| Body Parameter of advanced configuration | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_advanced_configuration_put**
> services_web_application_name_advanced_configuration_put(authorization, web_application_name, advanced_configuration)

EDIT Information of advanced configuration



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::AdvancedConfigurationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of advanced configuration

advanced_configuration = SwaggerClient::AdvancedConfigurationBody.new # AdvancedConfigurationBody | Body Parameter of advanced configuration


begin
  #EDIT Information of advanced configuration
  api_instance.services_web_application_name_advanced_configuration_put(authorization, web_application_name, advanced_configuration)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AdvancedConfigurationApi->services_web_application_name_advanced_configuration_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of advanced configuration | 
 **advanced_configuration** | [**AdvancedConfigurationBody**](AdvancedConfigurationBody.md)| Body Parameter of advanced configuration | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



