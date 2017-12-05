require 'spec_helper'

provider_class = Puppet::Type.type(:security_policy_cookie_security).provider(:security_policy_cookie_securityprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:security_policy_cookie_security).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the security_policy_cookie_securityprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:security_policy_cookie_security).provider(:security_policy_cookie_securityprovider)
  end
end

