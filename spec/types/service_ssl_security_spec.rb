require 'rspec-puppet'

type_class = Puppet::Type.type(:service_ssl_security)
describe type_class do
  let :params do
    [
	:name,       
    ]
  end

  let :properties do
    [
	:ciphers,
	:enable_sni,
	:certificate,
	:status,
	:hsts_max_age,
	:enable_strict_sni_check,
	:sni_certificate,
	:ecdsa_certificate,
	:domain,
	:override_ciphers_ssl3,
	:override_ciphers_tls_1,
	:override_ciphers_tls_1_1,
	:enable_ssl_3,
	:enable_tls_1_1,
	:enable_hsts,
	:enable_tls_1_2,
	:include_hsts_sub_domains,
	:selected_ciphers,
	:sni_ecdsa_certificate,
	:enable_pfs,
	:enable_tls_1,      
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
