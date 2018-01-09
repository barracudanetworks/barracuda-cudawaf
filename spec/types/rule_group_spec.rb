require 'rspec-puppet'

type_class = Puppet::Type.type(:rule_group)
describe type_class do
  let :params do
    [
	:name,
	:service_name,
    ]
  end

  let :properties do
    [
	:access_log,
	:app_id,
	:comments,
	:cookie_age,
	:extended_match,
	:extended_match_sequence,
	:failover_method,	
	:header_name,
	:host_match,
	:lb_algorithm,
	:mode,
	:parameter_name,
	:persistence_cookie_domain,
	:persistence_cookie_name,
	:persistence_cookie_path,
	:persistence_idle_timeout,
	:persistence_method,
	:source_ip_netmask,
	:status,
	:url_match,
	:web_firewall_policy,      
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
