require 'spec_helper'

provider_class = Puppet::Type.type(:server_in_band_health_checks).provider(:server_in_band_health_checksprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:server_in_band_health_checks).new(
	name:'wafServer2',
	service_name:'httpsApp1',
	max_http_errors:11,
	max_refused:11,       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the server_in_band_health_checksprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:server_in_band_health_checks).provider(:server_in_band_health_checksprovider)
  end
end

