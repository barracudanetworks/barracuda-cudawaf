# SwaggerClient::IpReputationApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_ip_reputation_get**](IpReputationApi.md#services_web_application_name_ip_reputation_get) | **GET** /services/{Web Application Name}/ip-reputation | FETCH Information of ip reputation
[**services_web_application_name_ip_reputation_put**](IpReputationApi.md#services_web_application_name_ip_reputation_put) | **PUT** /services/{Web Application Name}/ip-reputation  | EDIT Information of ip reputation


# **services_web_application_name_ip_reputation_get**
> services_web_application_name_ip_reputation_get(authorization, web_application_name, opts)

FETCH Information of ip reputation



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::IpReputationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ip reputation

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of ip reputation
  api_instance.services_web_application_name_ip_reputation_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling IpReputationApi->services_web_application_name_ip_reputation_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ip reputation | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_ip_reputation_put**
> services_web_application_name_ip_reputation_put(authorization, web_application_name, ip_reputation)

EDIT Information of ip reputation



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::IpReputationApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ip reputation

ip_reputation = SwaggerClient::IpReputationBody.new # IpReputationBody | Body Parameter of ip reputation


begin
  #EDIT Information of ip reputation
  api_instance.services_web_application_name_ip_reputation_put(authorization, web_application_name, ip_reputation)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling IpReputationApi->services_web_application_name_ip_reputation_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ip reputation | 
 **ip_reputation** | [**IpReputationBody**](IpReputationBody.md)| Body Parameter of ip reputation | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



