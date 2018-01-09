require 'spec_helper'

provider_class = Puppet::Type.type(:service_ftp_security).provider(:service_ftp_securityprovider)

describe provider_class do
  let(:resource) {
    Puppet::Type.type(:service_ftp_security).new(
	name:'service_ftp',
	allowed_verb_status:'Yes',
	attack_prevention_status:'Yes',       
    )
  }

  let(:provider) { resource.provider }
  it 'should be an instance of the service_ftp_securityprovider' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:service_ftp_security).provider(:service_ftp_securityprovider)
  end
end

