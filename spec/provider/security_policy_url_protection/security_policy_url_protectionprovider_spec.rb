require 'spec_helper'

provider_class = Puppet::Type.type(:security_policy_url_protection).provider(:security_policy_url_protectionprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:security_policy_url_protection).new(
	name:'owa',
	max_content_length:2012,
	max_parameters:55,
	maximum_parameter_name_length:99,       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the security_policy_url_protectionprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:security_policy_url_protection).provider(:security_policy_url_protectionprovider)
  end
end

