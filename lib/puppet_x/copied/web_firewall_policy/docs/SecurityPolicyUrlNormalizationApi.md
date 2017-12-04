# SwaggerClient::SecurityPolicyUrlNormalizationApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_policies_policy_name_url_normalization_get**](SecurityPolicyUrlNormalizationApi.md#security_policies_policy_name_url_normalization_get) | **GET** /security-policies/{Policy Name}/url-normalization | FETCH Information of Security Policy url normalization
[**security_policies_policy_name_url_normalization_put**](SecurityPolicyUrlNormalizationApi.md#security_policies_policy_name_url_normalization_put) | **PUT** /security-policies/{Policy Name}/url-normalization  | EDIT Information of Security Policy url normalization


# **security_policies_policy_name_url_normalization_get**
> security_policies_policy_name_url_normalization_get(authorization, policy_name, opts)

FETCH Information of Security Policy url normalization



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyUrlNormalizationApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy url normalization

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Security Policy url normalization
  api_instance.security_policies_policy_name_url_normalization_get(authorization, policy_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyUrlNormalizationApi->security_policies_policy_name_url_normalization_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy url normalization | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_url_normalization_put**
> security_policies_policy_name_url_normalization_put(authorization, policy_name, security_policy_url_normalization)

EDIT Information of Security Policy url normalization



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyUrlNormalizationApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy url normalization

security_policy_url_normalization = SwaggerClient::SecurityPolicyUrlNormalizationBody.new # SecurityPolicyUrlNormalizationBody | Body Parameter of Security Policy url normalization


begin
  #EDIT Information of Security Policy url normalization
  api_instance.security_policies_policy_name_url_normalization_put(authorization, policy_name, security_policy_url_normalization)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyUrlNormalizationApi->security_policies_policy_name_url_normalization_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy url normalization | 
 **security_policy_url_normalization** | [**SecurityPolicyUrlNormalizationBody**](SecurityPolicyUrlNormalizationBody.md)| Body Parameter of Security Policy url normalization | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



