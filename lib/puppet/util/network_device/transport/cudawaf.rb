require 'puppet/util/network_device'
require 'puppet/util/network_device/transport'
require 'puppet/util/network_device/transport/base'
require 'puppet_x/swagger_client/configuration'

Dir["puppet_x/modules/*.rb"].each { |file| require file }

#require 'puppet_x/modules/login_info'
#require 'puppet_x/modules/system_api'
#require 'puppet_x/modules/service_api'
#require 'puppet_x/modules/server_api'
#require 'puppet_x/modules/security_policy_api'

require 'json'
require 'logger'
require 'base64'
require 'uri'

$mapped_object_types = {
                        "System" => "system", 
                        "Service" => "web_application_name", 
                        "SecurityPolicy" => "web_firewall_policy_name", 
                        "Server" => "server_name",
                        "RuleGroup" => "rule_group_name",
                        "RuleGroupServer" => "rg_web_server_name" }

class Puppet::Util::NetworkDevice::Transport::Cudawaf < Puppet::Util::NetworkDevice::Transport::Base
  attr_reader :transport, :url

  #
  #  Initialize the transport layer object using the SwaggerClient SDK for WAF.
  #
  def initialize(url, _options = {})
    @device_url = URI.parse(url)
    Puppet.debug("Puppet::Device::Cudawaf: connecting to WAF device - " + url)

    #raise ArgumentError, "Invalid scheme #{url.scheme}. Must be https" unless url.scheme == 'https'
    raise ArgumentError, "no user specified" unless @device_url.user
    raise ArgumentError, "no password specified" unless @device_url.password

    @transport = SwaggerClient::Configuration.new(url)
  end

  #
  #  Support the major API methods via the Transport layer here using the Swagger SDK client.
  #  Supported methods - GET, POST, PUT and DELETE.
  #
  #  Few utility functions are implemented -
  #  1. failure - check if the API request ended in a non-success error message (2xx is success, anything else is a failure).
  #  2. valid_json - check if the POSTDATA passed to the API request is syntactically valid or not.
  #

  #
  #  GET method - list objects. Also used for retrieving the device facts.
  #  Example usage:
  #    transport.get(url, "Service", "service_web_application_name_get", "svcName")
  #
  def get(device, instance, *args)
    *get_args, last = *args
    instance_plural = convert_plural(instance)

    if get_args.empty? or last.empty?
        get_method = instance_plural.downcase + "_get_with_http_info"
    else
        instance_var_name = get_mapped_object_name(instance)
        get_method = instance_plural.downcase + "_" + instance_var_name + "_get_with_http_info"
    end

    auth_header = get_auth_header(device)

    #
    #  Form the instance based on the URL passed and invoke the appropriate SwaggerClient SDK.
    #  Each provider will pass the object type as the instance and we would instantiate the appropriate SwaggerClient object.
    #
    object_instance = "SwaggerClient::#{instance}Api"
    Puppet.debug("Invoking GET for URL - " + device + ", Instance - " + instance + ", SDK API - " + object_instance, ", GET method - " + get_method)

    instance_method = Object.const_get(object_instance).new(device).method(get_method)
    response,status_code,headers = instance_method.call(auth_header, *args)
    parsed_response = JSON.parse(response)

    Puppet.debug("Response received from WAF for GET operation:  #{parsed_response}")

    if response.to_s.empty?
      fail("Not able to process the request. Please check the request parameters.")
    end

    failure?(parsed_response, status_code)
    return parsed_response, status_code
  end

  #
  #  POST method - create a new instance of a Puppet object type.
  #
  def post(device, instance, *postdata)
    instance_plural = convert_plural(instance)
    post_method = instance_plural + "_post_with_http_info"

    #if valid_json?(postdata)
      auth_header = get_auth_header(device)

      #
      #  Form the instance based on the URL passed and invoke the appropriate SwaggerClient SDK.
      #  Each provider will pass the object type as the instance and we would instantiate the appropriate SwaggerClient object.
      #
      object_instance = "SwaggerClient::#{instance}Api"

      instance_method = Object.const_get(object_instance).new(device).method(post_method)
      response,status_code,headers = instance_method.call(auth_header, *postdata)
      parsed_response = JSON.parse(response)

      Puppet.debug("Response received from WAF for POST operation:  #{parsed_response}")

      failure?(parsed_response, status_code)
      return parsed_response
    #else
    #  fail('Invalid JSON detected in API request body.')
    #end
  end

  #
  #  PUT method - edit an existing instance of a Puppet object type.
  #
  def put(device, instance, *postdata)
    instance_plural = convert_plural(instance)
    instance_var_name = get_mapped_object_name(instance)
    put_method = instance_plural + "_" + instance_var_name + "_put_with_http_info"

    #if valid_json?(postdata)
      auth_header = get_auth_header(device)

      #
      #  Form the instance based on the URL passed and invoke the appropriate SwaggerClient SDK.
      #  Each provider will pass the object type as the instance and we would instantiate the appropriate SwaggerClient object.
      #
      object_instance = "SwaggerClient::#{instance}Api"

      instance_method = Object.const_get(object_instance).new(device).method(put_method)
      response,status_code,headers = instance_method.call(auth_header, *postdata)
      parsed_response = JSON.parse(response)

      Puppet.debug("Response received from WAF for PUT operation:  #{parsed_response}")

      failure?(parsed_response, status_code)
      return parsed_response
    #else
    #  fail('Invalid JSON detected in API request body.')
    #end
  end

  #
  #  DELETE method - delete an existing instance of a Puppet object type.
  #
  def delete(device, instance, *args)
    instance_plural = convert_plural(instance)
    instance_var_name = get_mapped_object_name(instance)
    delete_method = instance_plural + "_" + instance_var_name + "_delete_with_http_info"

    auth_header = get_auth_header(device)

    #
    #  Form the instance based on the URL passed and invoke the appropriate SwaggerClient SDK.
    #  Each provider will pass the object type as the instance and we would instantiate the appropriate SwaggerClient object.
    #
    object_instance = "SwaggerClient::#{instance}Api"

    instance_method = Object.const_get(object_instance).new(device).method(delete_method)
    response,status_code,headers = instance_method.call(auth_header, *args)
    parsed_response = JSON.parse(response)

    Puppet.debug("Response received from WAF for DELETE operation:  #{parsed_response}")

    failure?(parsed_response, status_code)
    return parsed_response
  end

  #
  #  Get the login token for subsequent API calls.
  #  Accepts device url as input - to figure out which WAF to get the token for.
  #
  def get_auth_header(device)
    login_instance = Login.new
    auth_header = login_instance.get_auth_header(device)

    Puppet.debug("WAF authorization token:  #{auth_header}")
    return auth_header
  end

  #
  #  Util function to check if API method resulted in success or failure.
  #  WAF returns the following status codes -
  #  2xx - success codes (200, 201, 202)
  #  3xx, 4xx, 5xx - error codes (authentication errors, malformed JSON errors, resource not found, server errors etc)
  #
  #  Failure stops further processing and returns the error message to the user.
  #
  def failure?(result, status_code)
    if status_code == 200 or status_code == 201 or status_code == 202 then
      Puppet.debug("API method successfully executed with status code #{status_code}")
    else
      fail("REST failure: HTTP status code #{status_code} detected.  Error is: #{result}")
    end
  end

  #
  #  Util function to check if the body of the request is valid well-formed JSON.
  #  Returns a boolean value.
  #
  def valid_json?(json)
    JSON.parse(json)
    return true
  rescue
    return false
  end

  #
  # Util function to build the JSON array to post the request to WAF.
  #
  def message(object)
    opts=object.to_hash
    opts.delete(:provider)
    opts.delete(:ensure)
    opts.delete(:loglevel)  
    opts=convert_underscores(opts)
    params=opts
    Puppet.debug("PARAM....................#{params}")
    return params
  end

  #
  #  Puppet doesn't accept hyphenated strings for parameters, so we need to convert them to underscores.
  #
  def convert_underscores(hash)
    hash.each_with_object({}) do |(k ,v), obj|
      key = k.to_s.gsub(/_/, '-').to_sym
      obj[key] = v
    end
  end

  #
  #  Given an object name, convert it to the plural version since the SDK is written that way.
  #
  def convert_plural(object_name)
    pluralized_string = object_name
    Puppet.debug("Pluralizing object - " + object_name)

    if object_name =~ /^System$/i
      #  do nothing
    elsif object_name =~ /y$/
      pluralized_string = object_name.sub(/y$/, "ies")
    elsif object_name =~ /s$/
      pluralized_string = object_name + "es"
    else
      pluralized_string = object_name + "s"
    end

    return pluralized_string.downcase
  end

  #
  #  Get the internally mapped object name for an external name.
  #  Example: "Service" ==> "web_application_name"
  #
  def get_mapped_object_name(object)
    return $mapped_object_types[object]
  end

  #
  #  Support the major API methods via the Transport layer using the RestClient library here.
  #  Supported methods - GET, POST, PUT and DELETE.
  #
  def client_get(device, instance, *args)
    *get_args, last = *args
  end

  def client_put(device, instance, *args)
    *put_args, last = *args
  end

  def client_post(device, instance, *args)
    *post_args, last = *args
  end

  def client_delete(device, instance, *args)
    *delete_args, last = *args
  end

end
