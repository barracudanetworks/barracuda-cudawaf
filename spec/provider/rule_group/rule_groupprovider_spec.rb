require 'spec_helper'

provider_class = Puppet::Type.type(:rule_group).provider(:rule_groupprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:rule_group).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the rule_groupprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:rule_group).provider(:rule_groupprovider)
  end
end

