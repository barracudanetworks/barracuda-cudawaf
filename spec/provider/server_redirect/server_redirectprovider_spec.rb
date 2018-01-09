require 'spec_helper'

provider_class = Puppet::Type.type(:server_redirect).provider(:server_redirectprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:server_redirect).new(
	name:'server_redirect',       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the server_redirectprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:server_redirect).provider(:server_redirectprovider)
  end
end

