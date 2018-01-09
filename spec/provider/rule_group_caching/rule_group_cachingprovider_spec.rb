require 'spec_helper'

provider_class = Puppet::Type.type(:rule_group_caching).provider(:rule_group_cachingprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:rule_group_caching).new(
	name:'Rule1',
    	service_name:'httpsApp1',
    	status:'On',
    	max_size:512,       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the rule_group_cachingprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:rule_group_caching).provider(:rule_group_cachingprovider)
  end
end

