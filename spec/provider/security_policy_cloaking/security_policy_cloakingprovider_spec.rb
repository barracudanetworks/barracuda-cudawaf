require 'spec_helper'

provider_class = Puppet::Type.type(:security_policy_cloaking).provider(:security_policy_cloakingprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:security_policy_cloaking).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the security_policy_cloakingprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:security_policy_cloaking).provider(:security_policy_cloakingprovider)
  end
end

