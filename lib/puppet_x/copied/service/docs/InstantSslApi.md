# SwaggerClient::InstantSslApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_instant_ssl_get**](InstantSslApi.md#services_web_application_name_instant_ssl_get) | **GET** /services/{Web Application Name}/instant-ssl | FETCH Information of instant ssl
[**services_web_application_name_instant_ssl_put**](InstantSslApi.md#services_web_application_name_instant_ssl_put) | **PUT** /services/{Web Application Name}/instant-ssl  | EDIT Information of instant ssl


# **services_web_application_name_instant_ssl_get**
> services_web_application_name_instant_ssl_get(authorization, web_application_name, opts)

FETCH Information of instant ssl



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::InstantSslApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of instant ssl

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of instant ssl
  api_instance.services_web_application_name_instant_ssl_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InstantSslApi->services_web_application_name_instant_ssl_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of instant ssl | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_instant_ssl_put**
> services_web_application_name_instant_ssl_put(authorization, web_application_name, instant_ssl)

EDIT Information of instant ssl



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::InstantSslApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of instant ssl

instant_ssl = SwaggerClient::InstantSslBody.new # InstantSslBody | Body Parameter of instant ssl


begin
  #EDIT Information of instant ssl
  api_instance.services_web_application_name_instant_ssl_put(authorization, web_application_name, instant_ssl)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InstantSslApi->services_web_application_name_instant_ssl_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of instant ssl | 
 **instant_ssl** | [**InstantSslBody**](InstantSslBody.md)| Body Parameter of instant ssl | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



