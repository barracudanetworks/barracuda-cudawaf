require 'spec_helper'

provider_class = Puppet::Type.type(:service_url_encryption).provider(:service_url_encryptionprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_url_encryption).new(    
        name: 'httpsApp1',
        status: 'On'       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_url_encryptionprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_url_encryption).provider(:service_url_encryptionprovider)
  end
end

