require 'spec_helper'

provider_class = Puppet::Type.type(:server_ssl_policy).provider(:server_ssl_policyprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:server_ssl_policy).new(
       
       
       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the server_ssl_policyprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:server_ssl_policy).provider(:server_ssl_policyprovider)
  end
end

