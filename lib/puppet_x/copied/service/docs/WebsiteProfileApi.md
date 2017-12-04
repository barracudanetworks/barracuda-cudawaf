# SwaggerClient::WebsiteProfileApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_website_profile_get**](WebsiteProfileApi.md#services_web_application_name_website_profile_get) | **GET** /services/{Web Application Name}/website-profile | FETCH Information of website profile
[**services_web_application_name_website_profile_put**](WebsiteProfileApi.md#services_web_application_name_website_profile_put) | **PUT** /services/{Web Application Name}/website-profile  | EDIT Information of website profile


# **services_web_application_name_website_profile_get**
> services_web_application_name_website_profile_get(authorization, web_application_name, opts)

FETCH Information of website profile



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::WebsiteProfileApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of website profile

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of website profile
  api_instance.services_web_application_name_website_profile_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling WebsiteProfileApi->services_web_application_name_website_profile_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of website profile | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_website_profile_put**
> services_web_application_name_website_profile_put(authorization, web_application_name, website_profile)

EDIT Information of website profile



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::WebsiteProfileApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of website profile

website_profile = SwaggerClient::WebsiteProfileBody.new # WebsiteProfileBody | Body Parameter of website profile


begin
  #EDIT Information of website profile
  api_instance.services_web_application_name_website_profile_put(authorization, web_application_name, website_profile)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling WebsiteProfileApi->services_web_application_name_website_profile_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of website profile | 
 **website_profile** | [**WebsiteProfileBody**](WebsiteProfileBody.md)| Body Parameter of website profile | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



