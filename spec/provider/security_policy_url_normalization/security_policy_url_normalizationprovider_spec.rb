require 'spec_helper'

provider_class = Puppet::Type.type(:security_policy_url_normalization).provider(:security_policy_url_normalizationprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:security_policy_url_normalization).new(
	name:'owa',
	parameter_separators:'Ampersand and Semicolon',       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the security_policy_url_normalizationprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:security_policy_url_normalization).provider(:security_policy_url_normalizationprovider)
  end
end

