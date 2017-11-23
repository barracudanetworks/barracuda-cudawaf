require 'spec_helper'

provider_class = Puppet::Type.type(:cloudcontrol).provider(:cloudcontrolprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:cloudcontrol).new(
      state: 'connected',
      connect_mode:'cloud',
      username:'username',
      password:'password',
    )
  }

  let(:provider) { resource.provider }

  it 'should be an instance of the cloudcontrolprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:cloudcontrol).provider(:cloudcontrolprovider)
  end
end
