require 'spec_helper'
# require 'puppetlabs_spec_helper/module_spec_helper'

type_class = Puppet::Type.type(:cudawaf_security_policy)

describe type_class do
  let :params do
    [
      :name
    ]
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
    type_class.new(name: 'testsecuritypolicy1', ensure: :present)
  end
end
