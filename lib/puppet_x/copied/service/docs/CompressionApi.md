# SwaggerClient::CompressionApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_compression_get**](CompressionApi.md#services_web_application_name_compression_get) | **GET** /services/{Web Application Name}/compression | FETCH Information of compression
[**services_web_application_name_compression_put**](CompressionApi.md#services_web_application_name_compression_put) | **PUT** /services/{Web Application Name}/compression  | EDIT Information of compression


# **services_web_application_name_compression_get**
> services_web_application_name_compression_get(authorization, web_application_name, opts)

FETCH Information of compression



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::CompressionApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of compression

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of compression
  api_instance.services_web_application_name_compression_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CompressionApi->services_web_application_name_compression_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of compression | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_compression_put**
> services_web_application_name_compression_put(authorization, web_application_name, compression)

EDIT Information of compression



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::CompressionApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of compression

compression = SwaggerClient::CompressionBody.new # CompressionBody | Body Parameter of compression


begin
  #EDIT Information of compression
  api_instance.services_web_application_name_compression_put(authorization, web_application_name, compression)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CompressionApi->services_web_application_name_compression_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of compression | 
 **compression** | [**CompressionBody**](CompressionBody.md)| Body Parameter of compression | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



