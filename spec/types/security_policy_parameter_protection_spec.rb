require 'rspec-puppet'

type_class = Puppet::Type.type(:security_policy_parameter_protection)
describe type_class do
  let :params do
    [
       :name,
    ]
  end

  let :properties do
    [
	:allowed_file_upload_type,
	:base64_decode_parameter_value,
	:blocked_attack_types,
	:custom_blocked_attack_types,
	:denied_metacharacters,
	:enable,
	:exception_patterns,
	:file_upload_extension,
	:file_upload_mime_types,
	:ignore_parameters,
	:maximum_instances,
	:maximum_parameter_value_length,
	:maximum_upload_file_size,
	:validate_parameter_name,      
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
    type_class.new(:name => 'httpsApp1', :ensure => :present)
  end

end
