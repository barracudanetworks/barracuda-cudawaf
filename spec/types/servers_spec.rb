require 'rspec-puppet'
#require 'puppetlabs_spec_helper/module_spec_helper'

type_class = Puppet::Type.type(:servers)

describe type_class do

  let :params do
    [
      :name,
      :service_name,
    ]
  end

  let :properties do
    [
      :address_version,
      :status,
      :hostname,
      :comments,
      :port,
      :identifier,
      :ip_address,
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
    expect {
      type_class.new({})
    }.to raise_error(Puppet::Error, 'Title or name must be provided')
  end

  it 'should support :present as a value to :ensure' do
    type_class.new(:name => 'waftestserver1', :ensure => :present)
  end

end

