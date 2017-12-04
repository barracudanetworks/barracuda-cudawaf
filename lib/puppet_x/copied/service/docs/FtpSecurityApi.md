# SwaggerClient::FtpSecurityApi

All URIs are relative to *http://&lt;WAF-IP&gt;/restapi/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**services_web_application_name_ftp_security_get**](FtpSecurityApi.md#services_web_application_name_ftp_security_get) | **GET** /services/{Web Application Name}/ftp-security  | FETCH Information of ftp security
[**services_web_application_name_ftp_security_post**](FtpSecurityApi.md#services_web_application_name_ftp_security_post) | **POST** /services/{Web Application Name}/ftp-security | ADD Information of ftp security
[**services_web_application_name_ftp_security_put**](FtpSecurityApi.md#services_web_application_name_ftp_security_put) | **PUT** /services/{Web Application Name}/ftp-security   | EDIT Information of ftp security


# **services_web_application_name_ftp_security_get**
> services_web_application_name_ftp_security_get(authorization, web_application_name, opts)

FETCH Information of ftp security



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::FtpSecurityApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ftp security

opts = { 
  fields: ["fields_example"] # Array<String> | 
}

begin
  #FETCH Information of ftp security
  api_instance.services_web_application_name_ftp_security_get(authorization, web_application_name, opts)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling FtpSecurityApi->services_web_application_name_ftp_security_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ftp security | 
 **fields** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_ftp_security_post**
> services_web_application_name_ftp_security_post(authorization, web_application_name, ftp_security)

ADD Information of ftp security



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::FtpSecurityApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ftp security

ftp_security = SwaggerClient::FtpSecurityBody.new # FtpSecurityBody | Body Parameter of ftp security


begin
  #ADD Information of ftp security
  api_instance.services_web_application_name_ftp_security_post(authorization, web_application_name, ftp_security)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling FtpSecurityApi->services_web_application_name_ftp_security_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ftp security | 
 **ftp_security** | [**FtpSecurityBody**](FtpSecurityBody.md)| Body Parameter of ftp security | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **services_web_application_name_ftp_security_put**
> services_web_application_name_ftp_security_put(authorization, web_application_name, ftp_security)

EDIT Information of ftp security



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::FtpSecurityApi.new

authorization = "authorization_example" # String | Login token

web_application_name = "web_application_name_example" # String | Web Application Name of ftp security

ftp_security = SwaggerClient::FtpSecurityBody.new # FtpSecurityBody | Body Parameter of ftp security


begin
  #EDIT Information of ftp security
  api_instance.services_web_application_name_ftp_security_put(authorization, web_application_name, ftp_security)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling FtpSecurityApi->services_web_application_name_ftp_security_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Login token | 
 **web_application_name** | **String**| Web Application Name of ftp security | 
 **ftp_security** | [**FtpSecurityBody**](FtpSecurityBody.md)| Body Parameter of ftp security | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



