require 'spec_helper'

provider_class = Puppet::Type.type(:service_adaptive_profiling).provider(:service_adaptive_profilingprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_adaptive_profiling).new(
	name:'httpsApp1',
	status:'On',
	response_learning:'Successes Only',
	request_learning:'Successes Only',       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_adaptive_profilingprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_adaptive_profiling).provider(:service_adaptive_profilingprovider)
  end
end

