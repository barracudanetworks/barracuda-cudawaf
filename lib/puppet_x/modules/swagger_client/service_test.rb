require_relative './api/service_api'
require_relative './api/server_api'

require_relative 'login_info.rb'

require 'json'
require 'base64'
require 'uri'

#
#  Handle token by doing a login API request first.
#  IMPORTANT: This snippet should be a part of every Puppet provider.
#
login_instance = Login.new
auth_header = login_instance.get_auth_header

#
#  Use the Ruby client SDK created by Swagger using the JSON file(s).
#
service_instance = SwaggerClient::ServiceApi.new

#
#  GET service details (all or a single service).
#
#service_instance.services_get(auth_header_token)
response = service_instance.services_web_application_name_get(auth_header, 'abcdef')
puts "Response - #{response}"

#
#  Create a new service.
#  TODO; This needs to read the manifest file for input.
#

#
#  Edit a service.
#  TODO; This needs to read the manifest file for input.
#

#
#  Delete a service (need to provide service name).
#
