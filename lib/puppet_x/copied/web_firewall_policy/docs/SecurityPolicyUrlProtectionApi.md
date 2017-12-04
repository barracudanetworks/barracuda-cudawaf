# SwaggerClient::SecurityPolicyUrlProtectionApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_policies_policy_name_url_protection_get**](SecurityPolicyUrlProtectionApi.md#security_policies_policy_name_url_protection_get) | **GET** /security-policies/{Policy Name}/url-protection | FETCH Information of Security Policy url protection
[**security_policies_policy_name_url_protection_put**](SecurityPolicyUrlProtectionApi.md#security_policies_policy_name_url_protection_put) | **PUT** /security-policies/{Policy Name}/url-protection  | EDIT Information of Security Policy url protection


# **security_policies_policy_name_url_protection_get**
> security_policies_policy_name_url_protection_get(authorization, policy_name, opts)

FETCH Information of Security Policy url protection



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyUrlProtectionApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy url protection

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Security Policy url protection
  api_instance.security_policies_policy_name_url_protection_get(authorization, policy_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyUrlProtectionApi->security_policies_policy_name_url_protection_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy url protection | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_url_protection_put**
> security_policies_policy_name_url_protection_put(authorization, policy_name, security_policy_url_protection)

EDIT Information of Security Policy url protection



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyUrlProtectionApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy url protection

security_policy_url_protection = SwaggerClient::SecurityPolicyUrlProtectionBody.new # SecurityPolicyUrlProtectionBody | Body Parameter of Security Policy url protection


begin
  #EDIT Information of Security Policy url protection
  api_instance.security_policies_policy_name_url_protection_put(authorization, policy_name, security_policy_url_protection)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyUrlProtectionApi->security_policies_policy_name_url_protection_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy url protection | 
 **security_policy_url_protection** | [**SecurityPolicyUrlProtectionBody**](SecurityPolicyUrlProtectionBody.md)| Body Parameter of Security Policy url protection | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



