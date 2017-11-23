require 'spec_helper'

provider_class = Puppet::Type.type(:services).provider(:serviceprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:services).new(
      name: 'httpsApp1',
      type: 'HTTPS',
      ip_address: '10.36.73.245',
      port: 8443,
      certificate: 'createdcert1',
      group: 'default',
      vsite: 'default',
      status:'On',
      address_version:'IPv4',
      comments:'Updating the comments',
    )
  }

  let(:provider) { resource.provider }

  it 'should be an instance of the serviceprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:services).provider(:serviceprovider)
  end
end
