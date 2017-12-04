# SwaggerClient::ConnectionPoolingApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_servers_web_server_name_connection_pooling_get**](ConnectionPoolingApi.md#services_web_application_name_servers_web_server_name_connection_pooling_get) | **GET** /services/{Web Application Name}/servers/{Web Server Name}/connection-pooling | FETCH Information of connection pooling
[**services_web_application_name_servers_web_server_name_connection_pooling_put**](ConnectionPoolingApi.md#services_web_application_name_servers_web_server_name_connection_pooling_put) | **PUT** /services/{Web Application Name}/servers/{Web Server Name}/connection-pooling  | EDIT Information of connection pooling


# **services_web_application_name_servers_web_server_name_connection_pooling_get**
> services_web_application_name_servers_web_server_name_connection_pooling_get(authorization, web_application_name, web_server_name, opts)

FETCH Information of connection pooling



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ConnectionPoolingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of connection pooling

web_server_name = "web_server_name_example" # String | Web Server Name of connection pooling

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of connection pooling
  api_instance.services_web_application_name_servers_web_server_name_connection_pooling_get(authorization, web_application_name, web_server_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ConnectionPoolingApi->services_web_application_name_servers_web_server_name_connection_pooling_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of connection pooling | 
 **web_server_name** | **String**| Web Server Name of connection pooling | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_servers_web_server_name_connection_pooling_put**
> services_web_application_name_servers_web_server_name_connection_pooling_put(authorization, web_application_name, web_server_name, connection_pooling)

EDIT Information of connection pooling



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ConnectionPoolingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of connection pooling

web_server_name = "web_server_name_example" # String | Web Server Name of connection pooling

connection_pooling = SwaggerClient::ConnectionPoolingBody.new # ConnectionPoolingBody | Body Parameter of connection pooling


begin
  #EDIT Information of connection pooling
  api_instance.services_web_application_name_servers_web_server_name_connection_pooling_put(authorization, web_application_name, web_server_name, connection_pooling)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ConnectionPoolingApi->services_web_application_name_servers_web_server_name_connection_pooling_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of connection pooling | 
 **web_server_name** | **String**| Web Server Name of connection pooling | 
 **connection_pooling** | [**ConnectionPoolingBody**](ConnectionPoolingBody.md)| Body Parameter of connection pooling | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



