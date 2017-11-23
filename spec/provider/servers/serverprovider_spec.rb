require 'spec_helper'

provider_class = Puppet::Type.type(:servers).provider(:serverprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:servers).new(
      name: 'waftestserver1',
      identifier: 'Hostname',
      ip_address: '10.36.73.245',
      hostname: 'imdb.com',
      service_name: 'httpsApp1',
      port: 8443,
      status:'In Service',
      address_version:'IPv4',
      comments:'Updating the comments',
    )
  }

  let(:provider) { resource.provider }

  it 'should be an instance of the serverprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:servers).provider(:serverprovider)
  end
end
