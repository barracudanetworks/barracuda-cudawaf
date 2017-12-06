require 'puppet/util/network_device'
require 'puppet/util/network_device/transport'
require 'puppet/util/network_device/transport/base'
require_relative '../../../puppet_x/modules/login_info.rb'

require 'json'
require 'logger'
require 'base64'

class Puppet::Util::NetworkDevice::Transport::Cudawaf < Puppet::Util::NetworkDevice::Transport::Base
  attr_reader :connection

  #
  #  Initialize the connection object using the SwaggerClient SDK for WAF.
  #
  def initialize(url, _options = {})
    @connection = SwaggerClient.new
  end

  #
  #  Support the major API methods via the Transport layer here.
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
  def get(device, instance, get_method, args)
    auth_header = get_auth_header(device)

    #
    #  Form the instance based on the URL passed and invoke the appropriate SwaggerClient SDK.
    #  Each provider will pass the object type as the instance and we would instantiate the appropriate SwaggerClient object.
    #
    object_instance = "SwaggerClient::#{instance}Api"
    object_instantiate = object_instance.method(new)
    instance = object_instantiate.call()

    instance_method = instance.method(get_method)
    response = instance_method.call(auth_header, args)
    parsed_response = JSON.parse(response)
    status_code = parsed_response["status_code"]

    Puppet.debug("Response received from WAF for GET operation:  #{parsed_response}")

    if response.to_s.empty?
      fail("Not able to process the request. Please check the request parameters.")
    end

    failure?(parsed_response)
    return parsed_response
  end

  #
  #  POST method - create a new instance of a Puppet object type.
  #
  def post(device, instance, post_method, postdata)
    if valid_json?(postdata)
      auth_header = get_auth_header(device)

      args = postdata

      #
      #  Form the instance based on the URL passed and invoke the appropriate SwaggerClient SDK.
      #  Each provider will pass the object type as the instance and we would instantiate the appropriate SwaggerClient object.
      #
      object_instance = "SwaggerClient::#{instance}Api"
      object_instantiate = object_instance.method(new)
      instance = object_instantiate.call()

      instance_method = instance.method(post_method)
      response = instance_method.call(auth_header, args)
      parsed_response = JSON.parse(response)
      status_code = parsed_response["status_code"]

      Puppet.debug("Response received from WAF for POST operation:  #{parsed_response}")

      failure?(parsed_response)
      return parsed_response
    else
      fail('Invalid JSON detected in API request body.')
    end
  end

  #
  #  PUT method - edit an existing instance of a Puppet object type.
  #
  def put(device, instance, put_method, postdata)
    if valid_json?(postdata)
      auth_header = get_auth_header(device)

      args = postdata

      #
      #  Form the instance based on the URL passed and invoke the appropriate SwaggerClient SDK.
      #  Each provider will pass the object type as the instance and we would instantiate the appropriate SwaggerClient object.
      #
      object_instance = "SwaggerClient::#{instance}Api"
      object_instantiate = object_instance.method(new)
      instance = object_instantiate.call()

      instance_method = instance.method(put_method)
      response = instance_method.call(auth_header, args)
      parsed_response = JSON.parse(response)
      status_code = parsed_response["status_code"]

      Puppet.debug("Response received from WAF for PUT operation:  #{parsed_response}")

      failure?(parsed_response)
      return parsed_response
    else
      fail('Invalid JSON detected in API request body.')
    end
  end

  #
  #  DELETE method - delete an existing instance of a Puppet object type.
  #
  def delete(device, instance, delete_method, args)
    auth_header = get_auth_header(device)

    #
    #  Form the instance based on the URL passed and invoke the appropriate SwaggerClient SDK.
    #  Each provider will pass the object type as the instance and we would instantiate the appropriate SwaggerClient object.
    #
    object_instance = "SwaggerClient::#{instance}Api"
    object_instantiate = object_instance.method(new)
    instance = object_instantiate.call()

    instance_method = instance.method(delete_method)
    response = instance_method.call(auth_header, args)
    parsed_response = JSON.parse(response)
    status_code = parsed_response["status_code"]

    Puppet.debug("Response received from WAF for DELETE operation:  #{parsed_response}")

    failure?(parsed_response)
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
  def failure?(result)
    if result["status_code"] == 200 or result["status_code"] == 201 or result["status_code"] == 202 then
      Puppet.debug("API method successfully executed with status code #{result.status}")
    else
      fail("REST failure: HTTP status code #{result.status} detected.  Error is: #{result.body}")
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

end
