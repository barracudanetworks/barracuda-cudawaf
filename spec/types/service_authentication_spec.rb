require 'rspec-puppet'

type_class = Puppet::Type.type(:service_authentication)
describe type_class do
  let :params do
    [
	:name,       
    ]
  end

  let :properties do
    [
	:login_page,
	:dual_login_page,
	:service_provider_org_name,
	:kerberos_spn,
	:login_failed_page,
	:signing_certificate,
	:login_processor_path,
	:count_window,
	:service_provider_entity_id,
	:cookie_domain,
	:send_domain_name,
	:login_successful_page,
	:session_timeout_for_activesync,
	:groups,
	:service_provider_display_name,
	:master_service_url,
	:encryption_certificate,
	:authentication_service,
	:logout_successful_page,
	:challenge_user_field,
	:logout_page,
	:access_denied_page,
	:master_service,
	:cookie_path,
	:login_challenge_page,
	:service_provider_org_url,
	:idle_timeout,
	:password_expired_url,
	:status,
	:post_processor_path,
	:dual_authentication,
	:sso_cookie_update_interval,
	:challenge_prompt_field,
	:max_failed_attempts,
	:enable_bruteforce_prevention,
	:creation_timeout,
	:kerberos_enable_delegation,
	:secondary_authentication_service,
	:action,
	:kerberos_debug_status,
	:logout_processor_path,
    ]
  end

  it 'should have expected properties' do
     properties.each do |property|
       expect(type_class.properties.map(&:name)).to be_include(property)
     end
  end

  it 'should have expected parameters' do
     params.each do |param|
       expect(type_class.parameters).to be_include(param)
     end
  end

  it 'should require a name' do
    expect {
    type_class.new({})
    }.to raise_error(Puppet::Error, 'Title or name must be provided')
  end

  it 'should support :present as a value to :ensure' do
    type_class.new(:name => 'httpsApp1', :ensure => :present)
  end

end
