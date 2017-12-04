# SwaggerClient::SecurityPolicyCookieSecurityApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_policies_policy_name_cookie_security_get**](SecurityPolicyCookieSecurityApi.md#security_policies_policy_name_cookie_security_get) | **GET** /security-policies/{Policy Name}/cookie-security | FETCH Information of Security Policy cookie security
[**security_policies_policy_name_cookie_security_put**](SecurityPolicyCookieSecurityApi.md#security_policies_policy_name_cookie_security_put) | **PUT** /security-policies/{Policy Name}/cookie-security  | EDIT Information of Security Policy cookie security


# **security_policies_policy_name_cookie_security_get**
> security_policies_policy_name_cookie_security_get(authorization, policy_name, opts)

FETCH Information of Security Policy cookie security



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyCookieSecurityApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy cookie security

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Security Policy cookie security
  api_instance.security_policies_policy_name_cookie_security_get(authorization, policy_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyCookieSecurityApi->security_policies_policy_name_cookie_security_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy cookie security | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_cookie_security_put**
> security_policies_policy_name_cookie_security_put(authorization, policy_name, security_policy_cookie_security)

EDIT Information of Security Policy cookie security



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SecurityPolicyCookieSecurityApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Security Policy cookie security

security_policy_cookie_security = SwaggerClient::SecurityPolicyCookieSecurityBody.new # SecurityPolicyCookieSecurityBody | Body Parameter of Security Policy cookie security


begin
  #EDIT Information of Security Policy cookie security
  api_instance.security_policies_policy_name_cookie_security_put(authorization, policy_name, security_policy_cookie_security)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SecurityPolicyCookieSecurityApi->security_policies_policy_name_cookie_security_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Security Policy cookie security | 
 **security_policy_cookie_security** | [**SecurityPolicyCookieSecurityBody**](SecurityPolicyCookieSecurityBody.md)| Body Parameter of Security Policy cookie security | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



