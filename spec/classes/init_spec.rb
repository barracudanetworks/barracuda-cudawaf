require 'spec_helper'
describe 'barracudawaf' do
  context 'with default values for all parameters' do
    it { should contain_class('barracudawaf') }
  end
end
