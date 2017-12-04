# SwaggerClient::UrlEncryptionApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_url_encryption_get**](UrlEncryptionApi.md#services_web_application_name_url_encryption_get) | **GET** /services/{Web Application Name}/url-encryption | FETCH Information of url encryption
[**services_web_application_name_url_encryption_put**](UrlEncryptionApi.md#services_web_application_name_url_encryption_put) | **PUT** /services/{Web Application Name}/url-encryption  | EDIT Information of url encryption


# **services_web_application_name_url_encryption_get**
> services_web_application_name_url_encryption_get(authorization, web_application_name, opts)

FETCH Information of url encryption



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::UrlEncryptionApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of url encryption

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of url encryption
  api_instance.services_web_application_name_url_encryption_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling UrlEncryptionApi->services_web_application_name_url_encryption_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of url encryption | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_url_encryption_put**
> services_web_application_name_url_encryption_put(authorization, web_application_name, url_encryption)

EDIT Information of url encryption



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::UrlEncryptionApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of url encryption

url_encryption = SwaggerClient::UrlEncryptionBody.new # UrlEncryptionBody | Body Parameter of url encryption


begin
  #EDIT Information of url encryption
  api_instance.services_web_application_name_url_encryption_put(authorization, web_application_name, url_encryption)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling UrlEncryptionApi->services_web_application_name_url_encryption_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of url encryption | 
 **url_encryption** | [**UrlEncryptionBody**](UrlEncryptionBody.md)| Body Parameter of url encryption | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



