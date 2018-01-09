require 'spec_helper'

provider_class = Puppet::Type.type(:rule_group_server_in_band_health_checks).provider(:rule_group_server_in_band_health_checksprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:rule_group_server_in_band_health_checks).new(
	name:'rgServer1',
    	service_name:'httpsApp1',
    	rule_group_name:'Rule1',
    	max_http_errors:111,
    	max_other_failure:11,
    	max_refused:11,       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the rule_group_server_in_band_health_checksprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:rule_group_server_in_band_health_checks).provider(:rule_group_server_in_band_health_checksprovider)
  end
end

