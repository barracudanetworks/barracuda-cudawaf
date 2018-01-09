require 'spec_helper'

provider_class = Puppet::Type.type(:rule_group_server_out_of_band_health_checks).provider(:rule_group_server_out_of_band_health_checksprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:rule_group_server_out_of_band_health_checks).new(
	name:'rgServer1',
	service_name:'httpsApp1',
 	rule_group_name:'Rule1',
 	interval:20        
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the rule_group_server_out_of_band_health_checksprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:rule_group_server_out_of_band_health_checks).provider(:rule_group_server_out_of_band_health_checksprovider)
  end
end

