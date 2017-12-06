require 'spec_helper'

provider_class = Puppet::Type.type(:security_policy_request_limits).provider(:security_policy_request_limitsprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:security_policy_request_limits).new(
	name:'owa',
	max_cookie_name_length:'123',
 	max_cookie_value_length:'5099',       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the security_policy_request_limitsprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:security_policy_request_limits).provider(:security_policy_request_limitsprovider)
  end
end

