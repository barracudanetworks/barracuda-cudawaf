# SwaggerClient::SecurityPolicyApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_policies_get**](SecurityPolicyApi.md#security_policies_get) | **GET** /security-policies  | FETCH Information of Security Policy
[**security_policies_policy_name_delete**](SecurityPolicyApi.md#security_policies_policy_name_delete) | **DELETE** /security-policies/{Policy Name} | DELETE Information of Security Policy
[**security_policies_policy_name_get**](SecurityPolicyApi.md#security_policies_policy_name_get) | **GET** /security-policies/{Policy Name}  | FETCH Information of Security Policy
[**security_policies_policy_name_put**](SecurityPolicyApi.md#security_policies_policy_name_put) | **PUT** /security-policies/{Policy Name}   | EDIT Information of Security Policy
[**security_policies_post**](SecurityPolicyApi.md#security_policies_post) | **POST** /security-policies | ADD Information of Security Policy


# **security_policies_get**
> security_policies_get(authorization, opts)

FETCH Information of Security Policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyApi.new

authorization = "authorization_example" # String | Login token

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Security Policy
  api_instance.security_policies_get(authorization, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyApi->security_policies_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_delete**
> security_policies_policy_name_delete(authorization, policy_name)

DELETE Information of Security Policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy


begin
  #DELETE Information of Security Policy
  api_instance.security_policies_policy_name_delete(authorization, policy_name)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyApi->security_policies_policy_name_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_get**
> security_policies_policy_name_get(authorization, policy_name, opts)

FETCH Information of Security Policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Security Policy
  api_instance.security_policies_policy_name_get(authorization, policy_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyApi->security_policies_policy_name_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_put**
> security_policies_policy_name_put(authorization, policy_name, security_policy)

EDIT Information of Security Policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy

security_policy = SwaggerClient::SecurityPolicyBody.new # SecurityPolicyBody | Body Parameter of Security Policy


begin
  #EDIT Information of Security Policy
  api_instance.security_policies_policy_name_put(authorization, policy_name, security_policy)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyApi->security_policies_policy_name_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy | 
 **security_policy** | [**SecurityPolicyBody**](SecurityPolicyBody.md)| Body Parameter of Security Policy | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_post**
> security_policies_post(authorization, security_policy)

ADD Information of Security Policy



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyApi.new

authorization = "authorization_example" # String | Login token

security_policy = SwaggerClient::SecurityPolicyBody.new # SecurityPolicyBody | Body Parameter of Security Policy


begin
  #ADD Information of Security Policy
  api_instance.security_policies_post(authorization, security_policy)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyApi->security_policies_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **security_policy** | [**SecurityPolicyBody**](SecurityPolicyBody.md)| Body Parameter of Security Policy | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



