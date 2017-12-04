require 'spec_helper'

provider_class = Puppet::Type.type(:service_slow_client_attack).provider(:service_slow_client_attackprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_slow_client_attack).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_slow_client_attackprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_slow_client_attack).provider(:service_slow_client_attackprovider)
  end
end

