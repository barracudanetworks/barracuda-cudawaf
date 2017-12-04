require 'spec_helper'

provider_class = Puppet::Type.type(:service_ssl_security).provider(:service_ssl_securityprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_ssl_security).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_ssl_securityprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_ssl_security).provider(:service_ssl_securityprovider)
  end
end

