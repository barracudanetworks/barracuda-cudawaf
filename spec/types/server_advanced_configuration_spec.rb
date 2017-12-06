require 'rspec-puppet'

type_class = Puppet::Type.type(:server_advanced_configuration)
describe type_class do
  let :params do
    [
       :name,
       :service_name,
    ]
  end

  let :properties do
    [
      :client_impersonation,
      :max_connections,
      :max_establishing_connections,
      :max_keepalive_requests,
      :max_requests,
      :max_spare_connections,
      :source_ip_to_connect,
      :timeout,      
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
