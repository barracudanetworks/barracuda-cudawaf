require 'spec_helper'

provider_class = Puppet::Type.type(:rule_group_server).provider(:rule_group_serverprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:rule_group_server).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the rule_group_serverprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:rule_group_server).provider(:rule_group_serverprovider)
  end
end

