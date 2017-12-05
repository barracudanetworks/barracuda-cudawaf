require 'spec_helper'

provider_class = Puppet::Type.type(:service_compression).provider(:service_compressionprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_compression).new(   
    name:'httpsApp1',
    status:'On'
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_compressionprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_compression).provider(:service_compressionprovider)
  end
end

