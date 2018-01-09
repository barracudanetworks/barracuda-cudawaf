require 'spec_helper'

provider_class = Puppet::Type.type(:service_ssl_client_authentication).provider(:service_ssl_client_authenticationprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_ssl_client_authentication).new(
	name:'client_authentication',
	enforce_client_certificate:'Yes',
	client_authentication:'Disable',
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_ssl_client_authenticationprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_ssl_client_authentication).provider(:service_ssl_client_authenticationprovider)
  end
end

