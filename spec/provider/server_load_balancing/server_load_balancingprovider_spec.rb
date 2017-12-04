require 'spec_helper'

provider_class = Puppet::Type.type(:server_load_balancing).provider(:server_load_balancingprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:server_load_balancing).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the server_load_balancingprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:server_load_balancing).provider(:server_load_balancingprovider)
  end
end

