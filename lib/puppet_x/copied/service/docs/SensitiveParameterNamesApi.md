# SwaggerClient::SensitiveParameterNamesApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_sensitive_parameter_names_get**](SensitiveParameterNamesApi.md#services_web_application_name_sensitive_parameter_names_get) | **GET** /services/{Web Application Name}/sensitive-parameter-names | FETCH Information of sensitive parameter names
[**services_web_application_name_sensitive_parameter_names_put**](SensitiveParameterNamesApi.md#services_web_application_name_sensitive_parameter_names_put) | **PUT** /services/{Web Application Name}/sensitive-parameter-names  | EDIT Information of sensitive parameter names


# **services_web_application_name_sensitive_parameter_names_get**
> services_web_application_name_sensitive_parameter_names_get(authorization, web_application_name, opts)

FETCH Information of sensitive parameter names



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SensitiveParameterNamesApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of sensitive parameter names

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of sensitive parameter names
  api_instance.services_web_application_name_sensitive_parameter_names_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SensitiveParameterNamesApi->services_web_application_name_sensitive_parameter_names_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of sensitive parameter names | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_sensitive_parameter_names_put**
> services_web_application_name_sensitive_parameter_names_put(authorization, web_application_name, sensitive_parameter_names)

EDIT Information of sensitive parameter names



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SensitiveParameterNamesApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of sensitive parameter names

sensitive_parameter_names = SwaggerClient::SensitiveParameterNamesBody.new # SensitiveParameterNamesBody | Body Parameter of sensitive parameter names


begin
  #EDIT Information of sensitive parameter names
  api_instance.services_web_application_name_sensitive_parameter_names_put(authorization, web_application_name, sensitive_parameter_names)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SensitiveParameterNamesApi->services_web_application_name_sensitive_parameter_names_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of sensitive parameter names | 
 **sensitive_parameter_names** | [**SensitiveParameterNamesBody**](SensitiveParameterNamesBody.md)| Body Parameter of sensitive parameter names | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



