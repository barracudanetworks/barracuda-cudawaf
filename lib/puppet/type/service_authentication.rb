Puppet::Type.newtype(:service_authentication) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:login_page) do
    desc "Login Page"
    defaultto :default-login-page
  end


  newproperty(:dual_login_page) do
    desc "Dual Login Page"
    defaultto :default-dual-login-page
  end


  newproperty(:service_provider_org_name) do
    desc "Organization Name"
  end


  newproperty(:kerberos_spn) do
    desc "Kerberos SPN"
  end


  newproperty(:login_failed_page) do
    desc "Login Failed Page"
    defaultto :default-login-failed-page
  end


  newproperty(:signing_certificate) do
    desc "Signing Certificate"
  end


  newproperty(:login_processor_path) do
    desc "Login Processor Path"
    defaultto :/nclogin.submit
  end


  newproperty(:count_window) do
    desc "Count Window"
    defaultto 60
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid count_window #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid count_window #{value}, Must not be greater than 3600") if value > 3600
    end
  end


  newproperty(:service_provider_entity_id) do
    desc "SP Entity ID"
  end


  newproperty(:cookie_domain) do
    desc "Session Cookie Domain"
  end


  newproperty(:send_domain_name) do
    desc "Send Domain Name to RADIUS/RSA Server"
    defaultto :Block
    newvalues(:Allow, :Block)
  end


  newproperty(:login_successful_page) do
    desc "Login Successful Page"
    defaultto :default-login-success-page
  end


  newproperty(:session_timeout_for_activesync) do
    desc "Session Timeout for ActiveSync"
    defaultto 480
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid session_timeout_for_activesync #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid session_timeout_for_activesync #{value}, Must not be greater than 86400") if value > 86400
    end
  end


  newproperty(:groups) do
    desc "Trusted Hosts Group"
  end


  newproperty(:service_provider_display_name) do
    desc "Organization Display Name"
  end


  newproperty(:master_service_url) do
    desc "Master Service URL"
  end


  newproperty(:encryption_certificate) do
    desc "Encryption Certificate"
  end


  newproperty(:authentication_service) do
    desc "Authentication Service"
  end


  newproperty(:logout_successful_page) do
    desc "Logout Successful Page"
    defaultto :default-logout-success-page
  end


  newproperty(:challenge_user_field) do
    desc "Challenge User Field"
    defaultto :challenge_user
  end


  newproperty(:logout_page) do
    desc "Logout Page"
    defaultto :default-login-success-page
  end


  newproperty(:access_denied_page) do
    desc "Access Denied Page"
    defaultto :default-access-denied-page
  end


  newproperty(:master_service) do
    desc "Master Service"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:cookie_path) do
    desc "Session Cookie Path"
    defaultto :/
  end


  newproperty(:login_challenge_page) do
    desc "Login Challenge Page"
    defaultto :default-challenge-page
  end


  newproperty(:service_provider_org_url) do
    desc "Organization URL"
    validate do |value|
      fail("Invalid service_provider_org_url #{value}, Illegal characters present") unless value =~ /^[hH][tT][tT][pP][sS]?[\:][\/][\/][^*]+$/
    end
  end


  newproperty(:idle_timeout) do
    desc "Idle Timeout"
    defaultto 15
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid idle_timeout #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid idle_timeout #{value}, Must not be greater than 86400") if value > 86400
    end
  end


  newproperty(:password_expired_url) do
    desc "Auth Password Expired URL"
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:post_processor_path) do
    desc "Post Processor Path"
    defaultto :/saml.sso/saml2/post
  end


  newproperty(:dual_authentication) do
    desc " Dual Authentication Required"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:sso_cookie_update_interval) do
    desc "SSO Cookie Update Interval"
    defaultto 30
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid sso_cookie_update_interval #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid sso_cookie_update_interval #{value}, Must not be greater than 86400") if value > 86400
    end
  end


  newproperty(:challenge_prompt_field) do
    desc "Challenge Prompt Field"
    defaultto :challenge_prompt
  end


  newproperty(:max_failed_attempts) do
    desc "Max Failed Attempts Allowed Per IP"
    defaultto 10
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid max_failed_attempts #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid max_failed_attempts #{value}, Must not be greater than 65535") if value > 65535
    end
  end


  newproperty(:enable_bruteforce_prevention) do
    desc "Enable Bruteforce Prevention"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:creation_timeout) do
    desc "Creation Timeout"
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid creation_timeout #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid creation_timeout #{value}, Must not be greater than 86400") if value > 86400
    end
  end


  newproperty(:kerberos_enable_delegation) do
    desc "Kerberos Delegation"
    defaultto :Yes
    newvalues(:Yes, :No)
  end


  newproperty(:secondary_authentication_service) do
    desc "Secondary Authentication Service"
  end


  newproperty(:action) do
    desc "Trusted Hosts Action"
    defaultto :Default
    newvalues(:Allow, :Default)
  end


  newproperty(:kerberos_debug_status) do
    desc "Enable Debug Logs"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:logout_processor_path) do
    desc "Logout Processor Path"
    defaultto :/saml.sso/slo/redirect
  end


end
