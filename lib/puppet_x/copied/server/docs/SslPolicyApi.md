# SwaggerClient::SslPolicyApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_servers_web_server_name_ssl_policy_get**](SslPolicyApi.md#services_web_application_name_servers_web_server_name_ssl_policy_get) | **GET** /services/{Web Application Name}/servers/{Web Server Name}/ssl-policy | FETCH Information of ssl policy
[**services_web_application_name_servers_web_server_name_ssl_policy_put**](SslPolicyApi.md#services_web_application_name_servers_web_server_name_ssl_policy_put) | **PUT** /services/{Web Application Name}/servers/{Web Server Name}/ssl-policy  | EDIT Information of ssl policy


# **services_web_application_name_servers_web_server_name_ssl_policy_get**
> services_web_application_name_servers_web_server_name_ssl_policy_get(authorization, web_application_name, web_server_name, opts)

FETCH Information of ssl policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SslPolicyApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ssl policy

web_server_name = "web_server_name_example" # String | Web Server Name of ssl policy

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of ssl policy
  api_instance.services_web_application_name_servers_web_server_name_ssl_policy_get(authorization, web_application_name, web_server_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SslPolicyApi->services_web_application_name_servers_web_server_name_ssl_policy_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ssl policy | 
 **web_server_name** | **String**| Web Server Name of ssl policy | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_servers_web_server_name_ssl_policy_put**
> services_web_application_name_servers_web_server_name_ssl_policy_put(authorization, web_application_name, web_server_name, ssl_policy)

EDIT Information of ssl policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SslPolicyApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ssl policy

web_server_name = "web_server_name_example" # String | Web Server Name of ssl policy

ssl_policy = SwaggerClient::SslPolicyBody.new # SslPolicyBody | Body Parameter of ssl policy


begin
  #EDIT Information of ssl policy
  api_instance.services_web_application_name_servers_web_server_name_ssl_policy_put(authorization, web_application_name, web_server_name, ssl_policy)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SslPolicyApi->services_web_application_name_servers_web_server_name_ssl_policy_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ssl policy | 
 **web_server_name** | **String**| Web Server Name of ssl policy | 
 **ssl_policy** | [**SslPolicyBody**](SslPolicyBody.md)| Body Parameter of ssl policy | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



