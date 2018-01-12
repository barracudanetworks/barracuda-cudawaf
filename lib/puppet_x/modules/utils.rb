#!/usr/bin/ruby

require 'net/http'
require 'uri'
require 'json'
require 'base64'
require 'logger'

#
#  Puppet doesn't accept hyphenated strings for parameters, so we need to convert them to underscores.
#
def convert_underscores(hash)
  hash.each_with_object({}) do |(k, v), obj|
    key = k.to_s.tr('_', '-').to_sym
    obj[key] = v
  end
end

def strip_nil_values(hash)
  hash.reject { |_k, v| v.nil? }
end

#
#  This is a util method to build the JSON array to post the request to WAF.
#  May be overridden by specific providers.
#
def message(object)
  opts = object.to_hash
  opts.delete(:provider)
  opts.delete(:ensure)
  opts.delete(:loglevel)
  opts = convert_underscores(opts)

  opts
end
