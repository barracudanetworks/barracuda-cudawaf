# SwaggerClient::SecurityPolicyCloakingApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_policies_policy_name_cloaking_get**](SecurityPolicyCloakingApi.md#security_policies_policy_name_cloaking_get) | **GET** /security-policies/{Policy Name}/cloaking | FETCH Information of Security Policy cloaking
[**security_policies_policy_name_cloaking_put**](SecurityPolicyCloakingApi.md#security_policies_policy_name_cloaking_put) | **PUT** /security-policies/{Policy Name}/cloaking  | EDIT Information of Security Policy cloaking


# **security_policies_policy_name_cloaking_get**
> security_policies_policy_name_cloaking_get(authorization, policy_name, opts)

FETCH Information of Security Policy cloaking



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyCloakingApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy cloaking

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Security Policy cloaking
  api_instance.security_policies_policy_name_cloaking_get(authorization, policy_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyCloakingApi->security_policies_policy_name_cloaking_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy cloaking | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_cloaking_put**
> security_policies_policy_name_cloaking_put(authorization, policy_name, security_policy_cloaking)

EDIT Information of Security Policy cloaking



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyCloakingApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy cloaking

security_policy_cloaking = SwaggerClient::SecurityPolicyCloakingBody.new # SecurityPolicyCloakingBody | Body Parameter of Security Policy cloaking


begin
  #EDIT Information of Security Policy cloaking
  api_instance.security_policies_policy_name_cloaking_put(authorization, policy_name, security_policy_cloaking)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyCloakingApi->security_policies_policy_name_cloaking_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy cloaking | 
 **security_policy_cloaking** | [**SecurityPolicyCloakingBody**](SecurityPolicyCloakingBody.md)| Body Parameter of Security Policy cloaking | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



