require 'spec_helper'

provider_class = Puppet::Type.type(:rule_group_server_redirect).provider(:rule_group_server_redirectprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:rule_group_server_redirect).new(
	name:'rule_group_server_redirect',       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the rule_group_server_redirectprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:rule_group_server_redirect).provider(:rule_group_server_redirectprovider)
  end
end

