require 'spec_helper'

provider_class = Puppet::Type.type(:security_policy_cloaking).provider(:security_policy_cloakingprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:security_policy_cloaking).new(
	name:'owa',
    	return_codes_to_exempt:[ 401, 404 ],
    	headers_to_filter:[ 'X-Forwarder-For', 'Server', 'X-AspNet-Version', 'X-Powered-By' ],        
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the security_policy_cloakingprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:security_policy_cloaking).provider(:security_policy_cloakingprovider)
  end
end

