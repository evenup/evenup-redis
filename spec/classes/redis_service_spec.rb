require 'spec_helper'

describe 'redis::service', :type => :class do

  it { should create_class('redis::service') }
  it { should contain_service('redis').with(
    'ensure'  => 'running',
    'enable'  => 'true'
  ) }

end
