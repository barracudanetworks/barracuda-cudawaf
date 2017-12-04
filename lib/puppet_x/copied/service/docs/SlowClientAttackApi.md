# SwaggerClient::SlowClientAttackApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_slow_client_attack_get**](SlowClientAttackApi.md#services_web_application_name_slow_client_attack_get) | **GET** /services/{Web Application Name}/slow-client-attack | FETCH Information of slow client attack
[**services_web_application_name_slow_client_attack_put**](SlowClientAttackApi.md#services_web_application_name_slow_client_attack_put) | **PUT** /services/{Web Application Name}/slow-client-attack  | EDIT Information of slow client attack


# **services_web_application_name_slow_client_attack_get**
> services_web_application_name_slow_client_attack_get(authorization, web_application_name, opts)

FETCH Information of slow client attack



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SlowClientAttackApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of slow client attack

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of slow client attack
  api_instance.services_web_application_name_slow_client_attack_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SlowClientAttackApi->services_web_application_name_slow_client_attack_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of slow client attack | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_slow_client_attack_put**
> services_web_application_name_slow_client_attack_put(authorization, web_application_name, slow_client_attack)

EDIT Information of slow client attack



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SlowClientAttackApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of slow client attack

slow_client_attack = SwaggerClient::SlowClientAttackBody.new # SlowClientAttackBody | Body Parameter of slow client attack


begin
  #EDIT Information of slow client attack
  api_instance.services_web_application_name_slow_client_attack_put(authorization, web_application_name, slow_client_attack)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SlowClientAttackApi->services_web_application_name_slow_client_attack_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of slow client attack | 
 **slow_client_attack** | [**SlowClientAttackBody**](SlowClientAttackBody.md)| Body Parameter of slow client attack | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



