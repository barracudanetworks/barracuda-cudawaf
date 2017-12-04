# SwaggerClient::AuthenticationApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_authentication_get**](AuthenticationApi.md#services_web_application_name_authentication_get) | **GET** /services/{Web Application Name}/authentication | FETCH Information of authentication
[**services_web_application_name_authentication_put**](AuthenticationApi.md#services_web_application_name_authentication_put) | **PUT** /services/{Web Application Name}/authentication  | EDIT Information of authentication


# **services_web_application_name_authentication_get**
> services_web_application_name_authentication_get(authorization, web_application_name, opts)

FETCH Information of authentication



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::AuthenticationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of authentication

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of authentication
  api_instance.services_web_application_name_authentication_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AuthenticationApi->services_web_application_name_authentication_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of authentication | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_authentication_put**
> services_web_application_name_authentication_put(authorization, web_application_name, authentication)

EDIT Information of authentication



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::AuthenticationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of authentication

authentication = SwaggerClient::AuthenticationBody.new # AuthenticationBody | Body Parameter of authentication


begin
  #EDIT Information of authentication
  api_instance.services_web_application_name_authentication_put(authorization, web_application_name, authentication)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AuthenticationApi->services_web_application_name_authentication_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of authentication | 
 **authentication** | [**AuthenticationBody**](AuthenticationBody.md)| Body Parameter of authentication | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



