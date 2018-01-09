require 'spec_helper'

provider_class = Puppet::Type.type(:service_ssl_ocsp).provider(:service_ssl_ocspprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_ssl_ocsp).new(
	name:'service_ssl',
	enable:'Yes',       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_ssl_ocspprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_ssl_ocsp).provider(:service_ssl_ocspprovider)
  end
end

