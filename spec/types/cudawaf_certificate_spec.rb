require 'spec_helper'
# require 'puppetlabs_spec_helper/module_spec_helper'

type_class = Puppet::Type.type(:cudawaf_certificate)

describe type_class do
  let :params do
    [
      :name
    ]
  end

  let :properties do
    %i[
      country_code
      allow_private_key_export
      key_type
      key_size
      organization_name
      san_certificate
      state
      common_name
      city
      organization_unit
      curve_type
      signed_certificate
      assign_associated_key
      key
      intermediary_certificate
      password
      upload
      trusted_certificate
      trusted_server_certificate
      type
    ]
  end

  it 'should have expected properties' do
    properties.each do |property|
      expect(type_class.properties.map(&:name)).to be_include(property)
    end
  end

  it 'should have expected parameters' do
    params.each do |param|
      expect(type_class.parameters).to be_include(param)
    end
  end

  it 'should require a name' do
    expect do
      type_class.new({})
    end.to raise_error(Puppet::Error, 'Title or name must be provided')
  end

  it 'should support :present as a value to :ensure' do
    type_class.new(name: 'waftestserver1', ensure: :present)
  end
end
