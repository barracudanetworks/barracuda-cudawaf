require 'spec_helper'

provider_class = Puppet::Type.type(:rule_group_server_ssl_policy).provider(:rule_group_server_ssl_policyprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:rule_group_server_ssl_policy).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the rule_group_server_ssl_policyprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:rule_group_server_ssl_policy).provider(:rule_group_server_ssl_policyprovider)
  end
end

