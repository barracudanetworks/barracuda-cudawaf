require 'spec_helper'

provider_class = Puppet::Type.type(:service_authentication).provider(:service_authenticationprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_authentication).new(
        name:'httpsApp1',
        status:'On'      
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_authenticationprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_authentication).provider(:service_authenticationprovider)
  end
end

