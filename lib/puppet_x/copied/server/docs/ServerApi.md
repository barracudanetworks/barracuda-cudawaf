# SwaggerClient::ServerApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_servers_get**](ServerApi.md#services_web_application_name_servers_get) | **GET** /services/{Web Application Name}/servers  | FETCH Information of Server
[**services_web_application_name_servers_post**](ServerApi.md#services_web_application_name_servers_post) | **POST** /services/{Web Application Name}/servers | ADD Information of Server
[**services_web_application_name_servers_server_name_delete**](ServerApi.md#services_web_application_name_servers_server_name_delete) | **DELETE** /services/{Web Application Name}/servers/{Server Name} | DELETE Information of Server
[**services_web_application_name_servers_server_name_get**](ServerApi.md#services_web_application_name_servers_server_name_get) | **GET** /services/{Web Application Name}/servers/{Server Name}   | FETCH Information of Server
[**services_web_application_name_servers_server_name_put**](ServerApi.md#services_web_application_name_servers_server_name_put) | **PUT** /services/{Web Application Name}/servers/{Server Name}  | EDIT Information of Server


# **services_web_application_name_servers_get**
> services_web_application_name_servers_get(authorization, web_application_name, opts)

FETCH Information of Server



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ServerApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Server

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Server
  api_instance.services_web_application_name_servers_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ServerApi->services_web_application_name_servers_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Server | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_servers_post**
> services_web_application_name_servers_post(authorization, web_application_name, server)

ADD Information of Server



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ServerApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Server

server = SwaggerClient::ServerBody.new # ServerBody | Body Parameter of Server


begin
  #ADD Information of Server
  api_instance.services_web_application_name_servers_post(authorization, web_application_name, server)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ServerApi->services_web_application_name_servers_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Server | 
 **server** | [**ServerBody**](ServerBody.md)| Body Parameter of Server | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_servers_server_name_delete**
> services_web_application_name_servers_server_name_delete(authorization, web_application_name, server_name)

DELETE Information of Server



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ServerApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Server

server_name = "server_name_example" # String | Server Name of Server


begin
  #DELETE Information of Server
  api_instance.services_web_application_name_servers_server_name_delete(authorization, web_application_name, server_name)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ServerApi->services_web_application_name_servers_server_name_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Server | 
 **server_name** | **String**| Server Name of Server | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_servers_server_name_get**
> services_web_application_name_servers_server_name_get(authorization, web_application_name, server_name, opts)

FETCH Information of Server



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ServerApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Server

server_name = "server_name_example" # String | Server Name of Server

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Server
  api_instance.services_web_application_name_servers_server_name_get(authorization, web_application_name, server_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ServerApi->services_web_application_name_servers_server_name_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Server | 
 **server_name** | **String**| Server Name of Server | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_servers_server_name_put**
> services_web_application_name_servers_server_name_put(authorization, web_application_name, server_name, server)

EDIT Information of Server



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ServerApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of Server

server_name = "server_name_example" # String | Server Name of Server

server = SwaggerClient::ServerBody.new # ServerBody | Body Parameter of Server


begin
  #EDIT Information of Server
  api_instance.services_web_application_name_servers_server_name_put(authorization, web_application_name, server_name, server)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ServerApi->services_web_application_name_servers_server_name_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of Server | 
 **server_name** | **String**| Server Name of Server | 
 **server** | [**ServerBody**](ServerBody.md)| Body Parameter of Server | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



