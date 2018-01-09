require 'spec_helper'

provider_class = Puppet::Type.type(:service_session_tracking).provider(:service_session_trackingprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_session_tracking).new(
	name:'session_tracting',
	status:'Off',       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_session_trackingprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_session_tracking).provider(:service_session_trackingprovider)
  end
end

