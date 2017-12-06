require 'spec_helper'

provider_class = Puppet::Type.type(:server_application_layer_health_checks).provider(:server_application_layer_health_checksprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:server_application_layer_health_checks).new(
	name:'wafServer2',
	service_name:'httpsApp1',
	url:'/index.html',       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the server_application_layer_health_checksprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:server_application_layer_health_checks).provider(:server_application_layer_health_checksprovider)
  end
end

