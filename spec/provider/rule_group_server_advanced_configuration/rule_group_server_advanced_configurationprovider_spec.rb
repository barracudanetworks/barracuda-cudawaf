require 'spec_helper'

provider_class = Puppet::Type.type(:rule_group_server_advanced_configuration).provider(:rule_group_server_advanced_configurationprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:rule_group_server_advanced_configuration).new(
	name:'rgServer1',
	service_name:'httpsApp1',
    	rule_group_name:'Rule1',
    	max_connections:10001,
    	max_establishing_connections:101,
    	max_keepalive_requests:111,
    	max_requests:1002,       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the rule_group_server_advanced_configurationprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:rule_group_server_advanced_configuration).provider(:rule_group_server_advanced_configurationprovider)
  end
end

