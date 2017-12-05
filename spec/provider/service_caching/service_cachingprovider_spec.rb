require 'spec_helper'

provider_class = Puppet::Type.type(:service_caching).provider(:service_cachingprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_caching).new(
    name:'httpsApp1',
    status:'On',
    expiry_age: 61
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_cachingprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_caching).provider(:service_cachingprovider)
  end
end

