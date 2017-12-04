# SwaggerClient::ActionPolicyApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_policies_policy_name_action_policies_attack_action_name_get**](ActionPolicyApi.md#security_policies_policy_name_action_policies_attack_action_name_get) | **GET** /security-policies/{Policy Name}/action-policies/{Attack Action Name} | FETCH Information of Action Policy
[**security_policies_policy_name_action_policies_attack_action_name_put**](ActionPolicyApi.md#security_policies_policy_name_action_policies_attack_action_name_put) | **PUT** /security-policies/{Policy Name}/action-policies/{Attack Action Name}  | EDIT Information of Action Policy
[**security_policies_policy_name_action_policies_get**](ActionPolicyApi.md#security_policies_policy_name_action_policies_get) | **GET** /security-policies/{Policy Name}/action-policies | FETCH Information of Action Policy


# **security_policies_policy_name_action_policies_attack_action_name_get**
> security_policies_policy_name_action_policies_attack_action_name_get(authorization, policy_name, attack_action_name, opts)

FETCH Information of Action Policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ActionPolicyApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Action Policy

attack_action_name = "attack_action_name_example" # String | Attack Action Name of Action Policy

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Action Policy
  api_instance.security_policies_policy_name_action_policies_attack_action_name_get(authorization, policy_name, attack_action_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ActionPolicyApi->security_policies_policy_name_action_policies_attack_action_name_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Action Policy | 
 **attack_action_name** | **String**| Attack Action Name of Action Policy | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_action_policies_attack_action_name_put**
> security_policies_policy_name_action_policies_attack_action_name_put(authorization, policy_name, attack_action_name, action_policy)

EDIT Information of Action Policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ActionPolicyApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Action Policy

attack_action_name = "attack_action_name_example" # String | Attack Action Name of Action Policy

action_policy = SwaggerClient::ActionPolicyBody.new # ActionPolicyBody | Body Parameter of Action Policy


begin
  #EDIT Information of Action Policy
  api_instance.security_policies_policy_name_action_policies_attack_action_name_put(authorization, policy_name, attack_action_name, action_policy)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ActionPolicyApi->security_policies_policy_name_action_policies_attack_action_name_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Action Policy | 
 **attack_action_name** | **String**| Attack Action Name of Action Policy | 
 **action_policy** | [**ActionPolicyBody**](ActionPolicyBody.md)| Body Parameter of Action Policy | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_action_policies_get**
> security_policies_policy_name_action_policies_get(authorization, policy_name, opts)

FETCH Information of Action Policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::ActionPolicyApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Action Policy

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Action Policy
  api_instance.security_policies_policy_name_action_policies_get(authorization, policy_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ActionPolicyApi->security_policies_policy_name_action_policies_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Action Policy | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



