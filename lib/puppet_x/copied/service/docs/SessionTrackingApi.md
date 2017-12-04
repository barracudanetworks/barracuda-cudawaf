# SwaggerClient::SessionTrackingApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_session_tracking_get**](SessionTrackingApi.md#services_web_application_name_session_tracking_get) | **GET** /services/{Web Application Name}/session-tracking | FETCH Information of session tracking
[**services_web_application_name_session_tracking_put**](SessionTrackingApi.md#services_web_application_name_session_tracking_put) | **PUT** /services/{Web Application Name}/session-tracking  | EDIT Information of session tracking


# **services_web_application_name_session_tracking_get**
> services_web_application_name_session_tracking_get(authorization, web_application_name, opts)

FETCH Information of session tracking



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SessionTrackingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of session tracking

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of session tracking
  api_instance.services_web_application_name_session_tracking_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SessionTrackingApi->services_web_application_name_session_tracking_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of session tracking | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_session_tracking_put**
> services_web_application_name_session_tracking_put(authorization, web_application_name, session_tracking)

EDIT Information of session tracking



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SessionTrackingApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of session tracking

session_tracking = SwaggerClient::SessionTrackingBody.new # SessionTrackingBody | Body Parameter of session tracking


begin
  #EDIT Information of session tracking
  api_instance.services_web_application_name_session_tracking_put(authorization, web_application_name, session_tracking)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SessionTrackingApi->services_web_application_name_session_tracking_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of session tracking | 
 **session_tracking** | [**SessionTrackingBody**](SessionTrackingBody.md)| Body Parameter of session tracking | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



