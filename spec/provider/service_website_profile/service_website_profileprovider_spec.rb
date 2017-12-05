require 'spec_helper'

provider_class = Puppet::Type.type(:service_website_profile).provider(:service_website_profileprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_website_profile).new(
    name:'httpsApp1',
    strict_profile_check:'Yes'
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_website_profileprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_website_profile).provider(:service_website_profileprovider)
  end
end

