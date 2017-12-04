# SwaggerClient::BasicSecurityApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_basic_security_get**](BasicSecurityApi.md#services_web_application_name_basic_security_get) | **GET** /services/{Web Application Name}/basic-security | FETCH Information of basic security
[**services_web_application_name_basic_security_put**](BasicSecurityApi.md#services_web_application_name_basic_security_put) | **PUT** /services/{Web Application Name}/basic-security  | EDIT Information of basic security


# **services_web_application_name_basic_security_get**
> services_web_application_name_basic_security_get(authorization, web_application_name, opts)

FETCH Information of basic security



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::BasicSecurityApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of basic security

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of basic security
  api_instance.services_web_application_name_basic_security_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling BasicSecurityApi->services_web_application_name_basic_security_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of basic security | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_basic_security_put**
> services_web_application_name_basic_security_put(authorization, web_application_name, basic_security)

EDIT Information of basic security



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::BasicSecurityApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of basic security

basic_security = SwaggerClient::BasicSecurityBody.new # BasicSecurityBody | Body Parameter of basic security


begin
  #EDIT Information of basic security
  api_instance.services_web_application_name_basic_security_put(authorization, web_application_name, basic_security)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling BasicSecurityApi->services_web_application_name_basic_security_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of basic security | 
 **basic_security** | [**BasicSecurityBody**](BasicSecurityBody.md)| Body Parameter of basic security | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



