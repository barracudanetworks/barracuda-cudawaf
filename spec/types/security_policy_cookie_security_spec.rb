require 'rspec-puppet'

type_class = Puppet::Type.type(:security_policy_cookie_security)
describe type_class do
  let :params do
    [
       :name,
    ]
  end

  let :properties do
    [
	:allow_unrecognized_cookies,
	:cookie_max_age,
	:cookie_replay_protection_type,
	:cookies_exempted,
	:custom_headers,
	:days_allowed,
	:http_only,
	:secure_cookie,
	:tamper_proof_mode,      
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
