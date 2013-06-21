require 'spec_helper'

describe 'redis::service', :type => :class do

  let(:params) { { :monitoring => '' } }
  it { should create_class('redis::service') }

  context 'on Debian' do
    let(:facts) { { :osfamily => 'Debian'} }

    it { should contain_service('redis-server').with(
      'ensure'  => 'running',
      'enable'  => 'true'
    ) }
  end
  
  it { should contain_service('redis').with(
    'ensure'  => 'running',
    'enable'  => 'true'
  ) }

  context 'sensu monitoring' do
    let(:params) { { :monitoring => 'sensu' } }
    it { should contain_class('redis::monitoring::sensu') }
  end

end
