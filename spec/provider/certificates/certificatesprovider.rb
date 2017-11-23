require 'spec_helper'

provider_class = Puppet::Type.type(:certificates).provider(:certificatesprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:certificates).new(
      name: 'createdcert1',
      city:'Bangalore',
      state:'Karnataka',
      common_name:'waf.test.local',
      country_code:'IN',
      key_size:'1024',
      key_type:'rsa',
      organization_name:'Barracuda Networks',
      organization_unit:'Engineering',
      allow_private_key_export: 'Yes',
    )
  }

  let(:provider) { resource.provider }

  it 'should be an instance of the certificatesprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:certificates).provider(:certificatesprovider)
  end
end
