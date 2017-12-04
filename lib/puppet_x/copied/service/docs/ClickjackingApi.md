# SwaggerClient::ClickjackingApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_clickjacking_get**](ClickjackingApi.md#services_web_application_name_clickjacking_get) | **GET** /services/{Web Application Name}/clickjacking | FETCH Information of clickjacking
[**services_web_application_name_clickjacking_put**](ClickjackingApi.md#services_web_application_name_clickjacking_put) | **PUT** /services/{Web Application Name}/clickjacking  | EDIT Information of clickjacking


# **services_web_application_name_clickjacking_get**
> services_web_application_name_clickjacking_get(authorization, web_application_name, opts)

FETCH Information of clickjacking



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ClickjackingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of clickjacking

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of clickjacking
  api_instance.services_web_application_name_clickjacking_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ClickjackingApi->services_web_application_name_clickjacking_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of clickjacking | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_clickjacking_put**
> services_web_application_name_clickjacking_put(authorization, web_application_name, clickjacking)

EDIT Information of clickjacking



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ClickjackingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of clickjacking

clickjacking = SwaggerClient::ClickjackingBody.new # ClickjackingBody | Body Parameter of clickjacking


begin
  #EDIT Information of clickjacking
  api_instance.services_web_application_name_clickjacking_put(authorization, web_application_name, clickjacking)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ClickjackingApi->services_web_application_name_clickjacking_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of clickjacking | 
 **clickjacking** | [**ClickjackingBody**](ClickjackingBody.md)| Body Parameter of clickjacking | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



