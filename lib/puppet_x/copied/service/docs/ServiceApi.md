# SwaggerClient::ServiceApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_get**](ServiceApi.md#services_get) | **GET** /services  | FETCH Information of Service
[**services_post**](ServiceApi.md#services_post) | **POST** /services | ADD Information of Service
[**services_web_application_name_delete**](ServiceApi.md#services_web_application_name_delete) | **DELETE** /services/{Web Application Name} | DELETE Information of Service
[**services_web_application_name_get**](ServiceApi.md#services_web_application_name_get) | **GET** /services/{Web Application Name}  | FETCH Information of Service
[**services_web_application_name_put**](ServiceApi.md#services_web_application_name_put) | **PUT** /services/{Web Application Name}   | EDIT Information of Service


# **services_get**
> services_get(authorization, opts)

FETCH Information of Service



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ServiceApi.new

authorization = "authorization_example" # String | Login token

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Service
  api_instance.services_get(authorization, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ServiceApi->services_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_post**
> services_post(authorization, service)

ADD Information of Service



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ServiceApi.new

authorization = "authorization_example" # String | Login token

service = SwaggerClient::ServiceBody.new # ServiceBody | Body Parameter of Service


begin
  #ADD Information of Service
  api_instance.services_post(authorization, service)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ServiceApi->services_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **service** | [**ServiceBody**](ServiceBody.md)| Body Parameter of Service | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_delete**
> services_web_application_name_delete(authorization, web_application_name)

DELETE Information of Service



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ServiceApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Service


begin
  #DELETE Information of Service
  api_instance.services_web_application_name_delete(authorization, web_application_name)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ServiceApi->services_web_application_name_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Service | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_get**
> services_web_application_name_get(authorization, web_application_name, opts)

FETCH Information of Service



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ServiceApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Service

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Service
  api_instance.services_web_application_name_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ServiceApi->services_web_application_name_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Service | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_put**
> services_web_application_name_put(authorization, web_application_name, service)

EDIT Information of Service



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ServiceApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Service

service = SwaggerClient::ServiceBody.new # ServiceBody | Body Parameter of Service


begin
  #EDIT Information of Service
  api_instance.services_web_application_name_put(authorization, web_application_name, service)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ServiceApi->services_web_application_name_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Service | 
 **service** | [**ServiceBody**](ServiceBody.md)| Body Parameter of Service | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



