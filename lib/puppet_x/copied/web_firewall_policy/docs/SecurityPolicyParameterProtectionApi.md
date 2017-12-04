# SwaggerClient::SecurityPolicyParameterProtectionApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_policies_policy_name_parameter_protection_get**](SecurityPolicyParameterProtectionApi.md#security_policies_policy_name_parameter_protection_get) | **GET** /security-policies/{Policy Name}/parameter-protection | FETCH Information of Security Policy parameter protection
[**security_policies_policy_name_parameter_protection_put**](SecurityPolicyParameterProtectionApi.md#security_policies_policy_name_parameter_protection_put) | **PUT** /security-policies/{Policy Name}/parameter-protection  | EDIT Information of Security Policy parameter protection


# **security_policies_policy_name_parameter_protection_get**
> security_policies_policy_name_parameter_protection_get(authorization, policy_name, opts)

FETCH Information of Security Policy parameter protection



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyParameterProtectionApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy parameter protection

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Security Policy parameter protection
  api_instance.security_policies_policy_name_parameter_protection_get(authorization, policy_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyParameterProtectionApi->security_policies_policy_name_parameter_protection_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy parameter protection | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_parameter_protection_put**
> security_policies_policy_name_parameter_protection_put(authorization, policy_name, security_policy_parameter_protection)

EDIT Information of Security Policy parameter protection



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyParameterProtectionApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy parameter protection

security_policy_parameter_protection = SwaggerClient::SecurityPolicyParameterProtectionBody.new # SecurityPolicyParameterProtectionBody | Body Parameter of Security Policy parameter protection


begin
  #EDIT Information of Security Policy parameter protection
  api_instance.security_policies_policy_name_parameter_protection_put(authorization, policy_name, security_policy_parameter_protection)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyParameterProtectionApi->security_policies_policy_name_parameter_protection_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy parameter protection | 
 **security_policy_parameter_protection** | [**SecurityPolicyParameterProtectionBody**](SecurityPolicyParameterProtectionBody.md)| Body Parameter of Security Policy parameter protection | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



