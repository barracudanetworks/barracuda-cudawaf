# SwaggerClient::SslOcspApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_ssl_ocsp_get**](SslOcspApi.md#services_web_application_name_ssl_ocsp_get) | **GET** /services/{Web Application Name}/ssl-ocsp | FETCH Information of ssl ocsp
[**services_web_application_name_ssl_ocsp_put**](SslOcspApi.md#services_web_application_name_ssl_ocsp_put) | **PUT** /services/{Web Application Name}/ssl-ocsp  | EDIT Information of ssl ocsp


# **services_web_application_name_ssl_ocsp_get**
> services_web_application_name_ssl_ocsp_get(authorization, web_application_name, opts)

FETCH Information of ssl ocsp



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SslOcspApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ssl ocsp

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of ssl ocsp
  api_instance.services_web_application_name_ssl_ocsp_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SslOcspApi->services_web_application_name_ssl_ocsp_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ssl ocsp | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_ssl_ocsp_put**
> services_web_application_name_ssl_ocsp_put(authorization, web_application_name, ssl_ocsp)

EDIT Information of ssl ocsp



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SslOcspApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ssl ocsp

ssl_ocsp = SwaggerClient::SslOcspBody.new # SslOcspBody | Body Parameter of ssl ocsp


begin
  #EDIT Information of ssl ocsp
  api_instance.services_web_application_name_ssl_ocsp_put(authorization, web_application_name, ssl_ocsp)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SslOcspApi->services_web_application_name_ssl_ocsp_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ssl ocsp | 
 **ssl_ocsp** | [**SslOcspBody**](SslOcspBody.md)| Body Parameter of ssl ocsp | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



