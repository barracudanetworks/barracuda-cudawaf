# SwaggerClient::SecurityPolicyRequestLimitsApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_policies_policy_name_request_limits_get**](SecurityPolicyRequestLimitsApi.md#security_policies_policy_name_request_limits_get) | **GET** /security-policies/{Policy Name}/request-limits | FETCH Information of Security Policy request limits
[**security_policies_policy_name_request_limits_put**](SecurityPolicyRequestLimitsApi.md#security_policies_policy_name_request_limits_put) | **PUT** /security-policies/{Policy Name}/request-limits  | EDIT Information of Security Policy request limits


# **security_policies_policy_name_request_limits_get**
> security_policies_policy_name_request_limits_get(authorization, policy_name, opts)

FETCH Information of Security Policy request limits



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyRequestLimitsApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy request limits

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Security Policy request limits
  api_instance.security_policies_policy_name_request_limits_get(authorization, policy_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyRequestLimitsApi->security_policies_policy_name_request_limits_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy request limits | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_request_limits_put**
> security_policies_policy_name_request_limits_put(authorization, policy_name, security_policy_request_limits)

EDIT Information of Security Policy request limits



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyRequestLimitsApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy request limits

security_policy_request_limits = SwaggerClient::SecurityPolicyRequestLimitsBody.new # SecurityPolicyRequestLimitsBody | Body Parameter of Security Policy request limits


begin
  #EDIT Information of Security Policy request limits
  api_instance.security_policies_policy_name_request_limits_put(authorization, policy_name, security_policy_request_limits)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyRequestLimitsApi->security_policies_policy_name_request_limits_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy request limits | 
 **security_policy_request_limits** | [**SecurityPolicyRequestLimitsBody**](SecurityPolicyRequestLimitsBody.md)| Body Parameter of Security Policy request limits | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



