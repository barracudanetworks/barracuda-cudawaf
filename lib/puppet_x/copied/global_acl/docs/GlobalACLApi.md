# SwaggerClient::GlobalACLApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_policies_policy_name_global_acls_get**](GlobalACLApi.md#security_policies_policy_name_global_acls_get) | **GET** /security-policies/{Policy Name}/global-acls  | FETCH Information of Global ACL
[**security_policies_policy_name_global_acls_post**](GlobalACLApi.md#security_policies_policy_name_global_acls_post) | **POST** /security-policies/{Policy Name}/global-acls | ADD Information of Global ACL
[**security_policies_policy_name_global_acls_urlacl_name_delete**](GlobalACLApi.md#security_policies_policy_name_global_acls_urlacl_name_delete) | **DELETE** /security-policies/{Policy Name}/global-acls/{URL ACL Name} | DELETE Information of Global ACL
[**security_policies_policy_name_global_acls_urlacl_name_get**](GlobalACLApi.md#security_policies_policy_name_global_acls_urlacl_name_get) | **GET** /security-policies/{Policy Name}/global-acls/{URL ACL Name}  | FETCH Information of Global ACL
[**security_policies_policy_name_global_acls_urlacl_name_put**](GlobalACLApi.md#security_policies_policy_name_global_acls_urlacl_name_put) | **PUT** /security-policies/{Policy Name}/global-acls/{URL ACL Name}   | EDIT Information of Global ACL


# **security_policies_policy_name_global_acls_get**
> security_policies_policy_name_global_acls_get(authorization, policy_name, opts)

FETCH Information of Global ACL



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::GlobalACLApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Global ACL

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Global ACL
  api_instance.security_policies_policy_name_global_acls_get(authorization, policy_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GlobalACLApi->security_policies_policy_name_global_acls_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Global ACL | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_global_acls_post**
> security_policies_policy_name_global_acls_post(authorization, policy_name, global_acl)

ADD Information of Global ACL



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::GlobalACLApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Global ACL

global_acl = SwaggerClient::GlobalACLBody.new # GlobalACLBody | Body Parameter of Global ACL


begin
  #ADD Information of Global ACL
  api_instance.security_policies_policy_name_global_acls_post(authorization, policy_name, global_acl)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GlobalACLApi->security_policies_policy_name_global_acls_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Global ACL | 
 **global_acl** | [**GlobalACLBody**](GlobalACLBody.md)| Body Parameter of Global ACL | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_global_acls_urlacl_name_delete**
> security_policies_policy_name_global_acls_urlacl_name_delete(authorization, policy_name, url_acl_name)

DELETE Information of Global ACL



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::GlobalACLApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Global ACL

url_acl_name = "url_acl_name_example" # String | URL ACL Name of Global ACL


begin
  #DELETE Information of Global ACL
  api_instance.security_policies_policy_name_global_acls_urlacl_name_delete(authorization, policy_name, url_acl_name)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GlobalACLApi->security_policies_policy_name_global_acls_urlacl_name_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Global ACL | 
 **url_acl_name** | **String**| URL ACL Name of Global ACL | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_global_acls_urlacl_name_get**
> security_policies_policy_name_global_acls_urlacl_name_get(authorization, policy_name, url_acl_name, opts)

FETCH Information of Global ACL



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::GlobalACLApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Global ACL

url_acl_name = "url_acl_name_example" # String | URL ACL Name of Global ACL

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Global ACL
  api_instance.security_policies_policy_name_global_acls_urlacl_name_get(authorization, policy_name, url_acl_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GlobalACLApi->security_policies_policy_name_global_acls_urlacl_name_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Global ACL | 
 **url_acl_name** | **String**| URL ACL Name of Global ACL | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_global_acls_urlacl_name_put**
> security_policies_policy_name_global_acls_urlacl_name_put(authorization, policy_name, url_acl_name, global_acl)

EDIT Information of Global ACL



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::GlobalACLApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Global ACL

url_acl_name = "url_acl_name_example" # String | URL ACL Name of Global ACL

global_acl = SwaggerClient::GlobalACLBody.new # GlobalACLBody | Body Parameter of Global ACL


begin
  #EDIT Information of Global ACL
  api_instance.security_policies_policy_name_global_acls_urlacl_name_put(authorization, policy_name, url_acl_name, global_acl)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GlobalACLApi->security_policies_policy_name_global_acls_urlacl_name_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Global ACL | 
 **url_acl_name** | **String**| URL ACL Name of Global ACL | 
 **global_acl** | [**GlobalACLBody**](GlobalACLBody.md)| Body Parameter of Global ACL | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



