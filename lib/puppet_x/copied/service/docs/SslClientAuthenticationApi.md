# SwaggerClient::SslClientAuthenticationApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_ssl_client_authentication_get**](SslClientAuthenticationApi.md#services_web_application_name_ssl_client_authentication_get) | **GET** /services/{Web Application Name}/ssl-client-authentication | FETCH Information of ssl client authentication
[**services_web_application_name_ssl_client_authentication_put**](SslClientAuthenticationApi.md#services_web_application_name_ssl_client_authentication_put) | **PUT** /services/{Web Application Name}/ssl-client-authentication  | EDIT Information of ssl client authentication


# **services_web_application_name_ssl_client_authentication_get**
> services_web_application_name_ssl_client_authentication_get(authorization, web_application_name, opts)

FETCH Information of ssl client authentication



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SslClientAuthenticationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ssl client authentication

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of ssl client authentication
  api_instance.services_web_application_name_ssl_client_authentication_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SslClientAuthenticationApi->services_web_application_name_ssl_client_authentication_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ssl client authentication | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_ssl_client_authentication_put**
> services_web_application_name_ssl_client_authentication_put(authorization, web_application_name, ssl_client_authentication)

EDIT Information of ssl client authentication



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SslClientAuthenticationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ssl client authentication

ssl_client_authentication = SwaggerClient::SslClientAuthenticationBody.new # SslClientAuthenticationBody | Body Parameter of ssl client authentication


begin
  #EDIT Information of ssl client authentication
  api_instance.services_web_application_name_ssl_client_authentication_put(authorization, web_application_name, ssl_client_authentication)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SslClientAuthenticationApi->services_web_application_name_ssl_client_authentication_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ssl client authentication | 
 **ssl_client_authentication** | [**SslClientAuthenticationBody**](SslClientAuthenticationBody.md)| Body Parameter of ssl client authentication | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



