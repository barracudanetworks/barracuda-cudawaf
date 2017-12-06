##init.pp##
class barracudawaf {
  security_policy  {  'securitypolicy1':
    ensure        => present,
    name          => 'junkpolicy'
  }

  security_policy_cloaking {  'SecPolCloaking-1':
    ensure          => present,
    name            => 'owa',
    return_codes_to_exempt => [ 401, 404 ],
    headers_to_filter => [ 'X-Forwarder-For', 'Server', 'X-AspNet-Version', 'X-Powered-By' ]
  }

  security_policy_parameter_protection {  'SecPolParamProtection-1':
    ensure          => present,
    name            => 'owa',
    maximum_instances => 1,
    maximum_parameter_value_length => 1056
  }

  security_policy_request_limits {  'SecPolReqLimits-1':
    ensure          => present,
    name            => 'owa',
    max_cookie_name_length => 123,
    max_cookie_value_length => 5099
  }

  security_policy_url_protection {  'SecPolUrlProtection-1':
    ensure          => present,
    name            => 'owa',
    max_content_length => 2012,
    max_parameters  => 55,
    maximum_parameter_name_length => 99
  }

  security_policy_cookie_security {  'SecPolCookieSec-1':
    ensure          => present,
    name            => 'owa',
    cookie_max_age  => 1414,
    days_allowed    => 10
  }

  security_policy_url_normalization {  'SecPolUrlNormalization-1':
    ensure          => present,
    name            => 'owa',
    parameter_separators => 'Ampersand and Semicolon'
  }

}
