# SwaggerClient::AdaptiveProfilingApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_adaptive_profiling_get**](AdaptiveProfilingApi.md#services_web_application_name_adaptive_profiling_get) | **GET** /services/{Web Application Name}/adaptive-profiling | FETCH Information of adaptive profiling
[**services_web_application_name_adaptive_profiling_put**](AdaptiveProfilingApi.md#services_web_application_name_adaptive_profiling_put) | **PUT** /services/{Web Application Name}/adaptive-profiling  | EDIT Information of adaptive profiling


# **services_web_application_name_adaptive_profiling_get**
> services_web_application_name_adaptive_profiling_get(authorization, web_application_name, opts)

FETCH Information of adaptive profiling



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::AdaptiveProfilingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of adaptive profiling

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of adaptive profiling
  api_instance.services_web_application_name_adaptive_profiling_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AdaptiveProfilingApi->services_web_application_name_adaptive_profiling_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of adaptive profiling | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_adaptive_profiling_put**
> services_web_application_name_adaptive_profiling_put(authorization, web_application_name, adaptive_profiling)

EDIT Information of adaptive profiling



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::AdaptiveProfilingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of adaptive profiling

adaptive_profiling = SwaggerClient::AdaptiveProfilingBody.new # AdaptiveProfilingBody | Body Parameter of adaptive profiling


begin
  #EDIT Information of adaptive profiling
  api_instance.services_web_application_name_adaptive_profiling_put(authorization, web_application_name, adaptive_profiling)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AdaptiveProfilingApi->services_web_application_name_adaptive_profiling_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of adaptive profiling | 
 **adaptive_profiling** | [**AdaptiveProfilingBody**](AdaptiveProfilingBody.md)| Body Parameter of adaptive profiling | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



