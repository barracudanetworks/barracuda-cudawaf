require 'spec_helper'

provider_class = Puppet::Type.type(:service_basic_security).provider(:service_basic_securityprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_basic_security).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_basic_securityprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_basic_security).provider(:service_basic_securityprovider)
  end
end

