require 'spec_helper'

type_class = Puppet::Type.type(:cudawaf_rule_group)
describe type_class do
  let :params do
    %i[
      name
      service_name
    ]
  end

  let :properties do
    %i[
      app_id
      comments
      extended_match
      extended_match_sequence
      host_match
      mode
      status
      url_match
      web_firewall_policy
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
    type_class.new(name: 'httpsApp1', ensure: :present)
  end
end
