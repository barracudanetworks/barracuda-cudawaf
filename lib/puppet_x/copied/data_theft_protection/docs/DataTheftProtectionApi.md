# SwaggerClient::DataTheftProtectionApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_policies_policy_name_protected_data_types_data_theft_element_name_delete**](DataTheftProtectionApi.md#security_policies_policy_name_protected_data_types_data_theft_element_name_delete) | **DELETE** /security-policies/{Policy Name}/protected-data-types/{Data Theft Element Name} | DELETE Information of Data Theft Protection
[**security_policies_policy_name_protected_data_types_data_theft_element_name_get**](DataTheftProtectionApi.md#security_policies_policy_name_protected_data_types_data_theft_element_name_get) | **GET** /security-policies/{Policy Name}/protected-data-types/{Data Theft Element Name}  | FETCH Information of Data Theft Protection
[**security_policies_policy_name_protected_data_types_data_theft_element_name_put**](DataTheftProtectionApi.md#security_policies_policy_name_protected_data_types_data_theft_element_name_put) | **PUT** /security-policies/{Policy Name}/protected-data-types/{Data Theft Element Name}   | EDIT Information of Data Theft Protection
[**security_policies_policy_name_protected_data_types_get**](DataTheftProtectionApi.md#security_policies_policy_name_protected_data_types_get) | **GET** /security-policies/{Policy Name}/protected-data-types  | FETCH Information of Data Theft Protection
[**security_policies_policy_name_protected_data_types_post**](DataTheftProtectionApi.md#security_policies_policy_name_protected_data_types_post) | **POST** /security-policies/{Policy Name}/protected-data-types | ADD Information of Data Theft Protection


# **security_policies_policy_name_protected_data_types_data_theft_element_name_delete**
> security_policies_policy_name_protected_data_types_data_theft_element_name_delete(authorization, policy_name, data_theft_element_name)

DELETE Information of Data Theft Protection



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DataTheftProtectionApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Data Theft Protection

data_theft_element_name = "data_theft_element_name_example" # String | Data Theft Element Name of Data Theft Protection


begin
  #DELETE Information of Data Theft Protection
  api_instance.security_policies_policy_name_protected_data_types_data_theft_element_name_delete(authorization, policy_name, data_theft_element_name)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DataTheftProtectionApi->security_policies_policy_name_protected_data_types_data_theft_element_name_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Data Theft Protection | 
 **data_theft_element_name** | **String**| Data Theft Element Name of Data Theft Protection | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_protected_data_types_data_theft_element_name_get**
> security_policies_policy_name_protected_data_types_data_theft_element_name_get(authorization, policy_name, data_theft_element_name, opts)

FETCH Information of Data Theft Protection



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DataTheftProtectionApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Data Theft Protection

data_theft_element_name = "data_theft_element_name_example" # String | Data Theft Element Name of Data Theft Protection

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Data Theft Protection
  api_instance.security_policies_policy_name_protected_data_types_data_theft_element_name_get(authorization, policy_name, data_theft_element_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DataTheftProtectionApi->security_policies_policy_name_protected_data_types_data_theft_element_name_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Data Theft Protection | 
 **data_theft_element_name** | **String**| Data Theft Element Name of Data Theft Protection | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_protected_data_types_data_theft_element_name_put**
> security_policies_policy_name_protected_data_types_data_theft_element_name_put(authorization, policy_name, data_theft_element_name, data_theft_protection)

EDIT Information of Data Theft Protection



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DataTheftProtectionApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Data Theft Protection

data_theft_element_name = "data_theft_element_name_example" # String | Data Theft Element Name of Data Theft Protection

data_theft_protection = SwaggerClient::DataTheftProtectionBody.new # DataTheftProtectionBody | Body Parameter of Data Theft Protection


begin
  #EDIT Information of Data Theft Protection
  api_instance.security_policies_policy_name_protected_data_types_data_theft_element_name_put(authorization, policy_name, data_theft_element_name, data_theft_protection)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DataTheftProtectionApi->security_policies_policy_name_protected_data_types_data_theft_element_name_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Data Theft Protection | 
 **data_theft_element_name** | **String**| Data Theft Element Name of Data Theft Protection | 
 **data_theft_protection** | [**DataTheftProtectionBody**](DataTheftProtectionBody.md)| Body Parameter of Data Theft Protection | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_protected_data_types_get**
> security_policies_policy_name_protected_data_types_get(authorization, policy_name, opts)

FETCH Information of Data Theft Protection



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DataTheftProtectionApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Data Theft Protection

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of Data Theft Protection
  api_instance.security_policies_policy_name_protected_data_types_get(authorization, policy_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DataTheftProtectionApi->security_policies_policy_name_protected_data_types_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Data Theft Protection | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **security_policies_policy_name_protected_data_types_post**
> security_policies_policy_name_protected_data_types_post(authorization, policy_name, data_theft_protection)

ADD Information of Data Theft Protection



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DataTheftProtectionApi.new

authorization = "authorization_example" # String | Login token

policy_name = "policy_name_example" # String | Policy Name of Data Theft Protection

data_theft_protection = SwaggerClient::DataTheftProtectionBody.new # DataTheftProtectionBody | Body Parameter of Data Theft Protection


begin
  #ADD Information of Data Theft Protection
  api_instance.security_policies_policy_name_protected_data_types_post(authorization, policy_name, data_theft_protection)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DataTheftProtectionApi->security_policies_policy_name_protected_data_types_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **policy_name** | **String**| Policy Name of Data Theft Protection | 
 **data_theft_protection** | [**DataTheftProtectionBody**](DataTheftProtectionBody.md)| Body Parameter of Data Theft Protection | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



