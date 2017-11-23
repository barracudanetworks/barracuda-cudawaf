require 'spec_helper'

provider_class = Puppet::Type.type(:security_policy).provider(:securitypolicyprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:security_policy).new(
      name: 'mytestpolicy1',
    )
  }

  let(:provider) { resource.provider }

  it 'should be an instance of the securitypolicyprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:security_policy).provider(:securitypolicyprovider)
  end
end
