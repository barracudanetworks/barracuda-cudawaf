# SwaggerClient::ExceptionProfilingApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_exception_profiling_get**](ExceptionProfilingApi.md#services_web_application_name_exception_profiling_get) | **GET** /services/{Web Application Name}/exception-profiling | FETCH Information of exception profiling
[**services_web_application_name_exception_profiling_put**](ExceptionProfilingApi.md#services_web_application_name_exception_profiling_put) | **PUT** /services/{Web Application Name}/exception-profiling  | EDIT Information of exception profiling


# **services_web_application_name_exception_profiling_get**
> services_web_application_name_exception_profiling_get(authorization, web_application_name, opts)

FETCH Information of exception profiling



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ExceptionProfilingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of exception profiling

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of exception profiling
  api_instance.services_web_application_name_exception_profiling_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ExceptionProfilingApi->services_web_application_name_exception_profiling_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of exception profiling | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_exception_profiling_put**
> services_web_application_name_exception_profiling_put(authorization, web_application_name, exception_profiling)

EDIT Information of exception profiling



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ExceptionProfilingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of exception profiling

exception_profiling = SwaggerClient::ExceptionProfilingBody.new # ExceptionProfilingBody | Body Parameter of exception profiling


begin
  #EDIT Information of exception profiling
  api_instance.services_web_application_name_exception_profiling_put(authorization, web_application_name, exception_profiling)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ExceptionProfilingApi->services_web_application_name_exception_profiling_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of exception profiling | 
 **exception_profiling** | [**ExceptionProfilingBody**](ExceptionProfilingBody.md)| Body Parameter of exception profiling | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



