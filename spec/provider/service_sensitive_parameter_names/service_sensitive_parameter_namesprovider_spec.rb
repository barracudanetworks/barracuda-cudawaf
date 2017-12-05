require 'spec_helper'

provider_class = Puppet::Type.type(:service_sensitive_parameter_names).provider(:service_sensitive_parameter_namesprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_sensitive_parameter_names).new(
    name:'httpsApp1',
    sensitive_parameter_names:'UserName,Password,CreditCardNumber'
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_sensitive_parameter_namesprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_sensitive_parameter_names).provider(:service_sensitive_parameter_namesprovider)
  end
end

