require 'spec_helper'

provider_class = Puppet::Type.type(:server_connection_pooling).provider(:server_connection_poolingprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:server_connection_pooling).new(
	name:'wafServer2',
	service_name:'httpsApp1',
	keepalive_timeout:'910000',
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the server_connection_poolingprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:server_connection_pooling).provider(:server_connection_poolingprovider)
  end
end

