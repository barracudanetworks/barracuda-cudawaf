require 'spec_helper'

provider_class = Puppet::Type.type(:server_out_of_band_health_checks).provider(:server_out_of_band_health_checksprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:server_out_of_band_health_checks).new(
	name:'wafServer2',
	service_name:'httpsApp1',
	interval:12,       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the server_out_of_band_health_checksprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:server_out_of_band_health_checks).provider(:server_out_of_band_health_checksprovider)
  end
end

