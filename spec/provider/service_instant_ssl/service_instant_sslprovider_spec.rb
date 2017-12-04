require 'spec_helper'

provider_class = Puppet::Type.type(:service_instant_ssl).provider(:service_instant_sslprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_instant_ssl).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_instant_sslprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_instant_ssl).provider(:service_instant_sslprovider)
  end
end

