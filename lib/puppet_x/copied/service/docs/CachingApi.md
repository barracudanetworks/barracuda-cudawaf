# SwaggerClient::CachingApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_caching_get**](CachingApi.md#services_web_application_name_caching_get) | **GET** /services/{Web Application Name}/caching | FETCH Information of caching
[**services_web_application_name_caching_put**](CachingApi.md#services_web_application_name_caching_put) | **PUT** /services/{Web Application Name}/caching  | EDIT Information of caching


# **services_web_application_name_caching_get**
> services_web_application_name_caching_get(authorization, web_application_name, opts)

FETCH Information of caching



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::CachingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of caching

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of caching
  api_instance.services_web_application_name_caching_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CachingApi->services_web_application_name_caching_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of caching | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_caching_put**
> services_web_application_name_caching_put(authorization, web_application_name, caching)

EDIT Information of caching



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::CachingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of caching

caching = SwaggerClient::CachingBody.new # CachingBody | Body Parameter of caching


begin
  #EDIT Information of caching
  api_instance.services_web_application_name_caching_put(authorization, web_application_name, caching)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CachingApi->services_web_application_name_caching_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of caching | 
 **caching** | [**CachingBody**](CachingBody.md)| Body Parameter of caching | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



