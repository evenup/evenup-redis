require 'spec_helper'

describe 'redis::install', :type => :class do

  it { should create_class('redis::install') }
  it { should contain_package('redis').with_ensure('latest') }
  
  context 'on Debian' do
    let(:facts) { { :osfamily => 'Debian'} }
    it { should contain_package('redis-server') }
  end

  context 'specify version' do
    let(:params) { { :version => '2.6.10' } }
    it { should contain_package('redis').with_ensure('2.6.10') }
  end

end
