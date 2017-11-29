=begin
#website profile API

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 3.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require "uri"

module SwaggerClient
  class WebsiteProfileApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # FETCH Information of website profile
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of website profile
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [nil]
    def services_web_application_name_website_profile_get(authorization, web_application_name, opts = {})
      data, status_code, headers = services_web_application_name_website_profile_get_with_http_info(authorization, web_application_name, opts)
      return data, status_code, headers
    end

    # FETCH Information of website profile
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of website profile
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_website_profile_get_with_http_info(authorization, web_application_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: WebsiteProfileApi.services_web_application_name_website_profile_get ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling WebsiteProfileApi.services_web_application_name_website_profile_get"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling WebsiteProfileApi.services_web_application_name_website_profile_get"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}/website-profile".sub('{' + 'Web Application Name' + '}', web_application_name.to_s)

      # query parameters
      query_params = {}
      query_params[:'fields'] = @api_client.build_collection_param(opts[:'fields'], :multi) if !opts[:'fields'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WebsiteProfileApi#services_web_application_name_website_profile_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # EDIT Information of website profile
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of website profile
    # @param website_profile Body Parameter of website profile
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def services_web_application_name_website_profile_put(authorization, web_application_name, website_profile, opts = {})
      data, status_code, headers = services_web_application_name_website_profile_put_with_http_info(authorization, web_application_name, website_profile, opts)
      return data, status_code, headers
    end

    # EDIT Information of website profile
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of website profile
    # @param website_profile Body Parameter of website profile
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_website_profile_put_with_http_info(authorization, web_application_name, website_profile, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: WebsiteProfileApi.services_web_application_name_website_profile_put ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling WebsiteProfileApi.services_web_application_name_website_profile_put"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling WebsiteProfileApi.services_web_application_name_website_profile_put"
      end
      # verify the required parameter 'website_profile' is set
      if @api_client.config.client_side_validation && website_profile.nil?
        fail ArgumentError, "Missing the required parameter 'website_profile' when calling WebsiteProfileApi.services_web_application_name_website_profile_put"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}/website-profile".sub('{' + 'Web Application Name' + '}', web_application_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(website_profile)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WebsiteProfileApi#services_web_application_name_website_profile_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
