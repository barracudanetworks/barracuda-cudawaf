# SwaggerClient::LoadBalancingApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_load_balancing_get**](LoadBalancingApi.md#services_web_application_name_load_balancing_get) | **GET** /services/{Web Application Name}/load-balancing  | FETCH Information of load balancing
[**services_web_application_name_load_balancing_post**](LoadBalancingApi.md#services_web_application_name_load_balancing_post) | **POST** /services/{Web Application Name}/load-balancing | ADD Information of load balancing
[**services_web_application_name_load_balancing_put**](LoadBalancingApi.md#services_web_application_name_load_balancing_put) | **PUT** /services/{Web Application Name}/load-balancing   | EDIT Information of load balancing


# **services_web_application_name_load_balancing_get**
> services_web_application_name_load_balancing_get(authorization, web_application_name, opts)

FETCH Information of load balancing



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::LoadBalancingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of load balancing

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of load balancing
  api_instance.services_web_application_name_load_balancing_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling LoadBalancingApi->services_web_application_name_load_balancing_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of load balancing | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_load_balancing_post**
> services_web_application_name_load_balancing_post(authorization, web_application_name, load_balancing)

ADD Information of load balancing



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::LoadBalancingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of load balancing

load_balancing = SwaggerClient::LoadBalancingBody.new # LoadBalancingBody | Body Parameter of load balancing


begin
  #ADD Information of load balancing
  api_instance.services_web_application_name_load_balancing_post(authorization, web_application_name, load_balancing)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling LoadBalancingApi->services_web_application_name_load_balancing_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of load balancing | 
 **load_balancing** | [**LoadBalancingBody**](LoadBalancingBody.md)| Body Parameter of load balancing | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_load_balancing_put**
> services_web_application_name_load_balancing_put(authorization, web_application_name, load_balancing)

EDIT Information of load balancing



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::LoadBalancingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of load balancing

load_balancing = SwaggerClient::LoadBalancingBody.new # LoadBalancingBody | Body Parameter of load balancing


begin
  #EDIT Information of load balancing
  api_instance.services_web_application_name_load_balancing_put(authorization, web_application_name, load_balancing)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling LoadBalancingApi->services_web_application_name_load_balancing_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of load balancing | 
 **load_balancing** | [**LoadBalancingBody**](LoadBalancingBody.md)| Body Parameter of load balancing | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



