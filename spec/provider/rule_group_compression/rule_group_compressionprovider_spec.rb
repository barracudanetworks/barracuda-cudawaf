require 'spec_helper'

provider_class = Puppet::Type.type(:rule_group_compression).provider(:rule_group_compressionprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:rule_group_compression).new(
	name:'Rule1',
    	service_name:'httpsApp1',
    	status:'On',
    	min_size:10111,
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the rule_group_compressionprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:rule_group_compression).provider(:rule_group_compressionprovider)
  end
end

