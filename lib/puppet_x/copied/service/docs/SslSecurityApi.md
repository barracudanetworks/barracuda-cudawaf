# SwaggerClient::SslSecurityApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_ssl_security_get**](SslSecurityApi.md#services_web_application_name_ssl_security_get) | **GET** /services/{Web Application Name}/ssl-security | FETCH Information of ssl security
[**services_web_application_name_ssl_security_put**](SslSecurityApi.md#services_web_application_name_ssl_security_put) | **PUT** /services/{Web Application Name}/ssl-security  | EDIT Information of ssl security


# **services_web_application_name_ssl_security_get**
> services_web_application_name_ssl_security_get(authorization, web_application_name, opts)

FETCH Information of ssl security



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SslSecurityApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ssl security

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of ssl security
  api_instance.services_web_application_name_ssl_security_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SslSecurityApi->services_web_application_name_ssl_security_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ssl security | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_ssl_security_put**
> services_web_application_name_ssl_security_put(authorization, web_application_name, ssl_security)

EDIT Information of ssl security



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SslSecurityApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ssl security

ssl_security = SwaggerClient::SslSecurityBody.new # SslSecurityBody | Body Parameter of ssl security


begin
  #EDIT Information of ssl security
  api_instance.services_web_application_name_ssl_security_put(authorization, web_application_name, ssl_security)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SslSecurityApi->services_web_application_name_ssl_security_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ssl security | 
 **ssl_security** | [**SslSecurityBody**](SslSecurityBody.md)| Body Parameter of ssl security | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



