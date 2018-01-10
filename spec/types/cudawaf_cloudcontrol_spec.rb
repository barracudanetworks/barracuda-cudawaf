require 'spec_helper'
# require 'puppetlabs_spec_helper/module_spec_helper'

type_class = Puppet::Type.type(:cudawaf_cloudcontrol)

describe type_class do
  let :params do
    [
      :state
    ]
  end

  let :properties do
    %i[
      connect_mode
      password
      username
      validation_token
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

  it 'should require a state' do
    expect do
      type_class.new({})
    end.to raise_error(Puppet::Error, 'Title or name must be provided')
  end

  it 'should support :present as a value to :ensure' do
    type_class.new(state: 'connected', ensure: :present)
  end
end
