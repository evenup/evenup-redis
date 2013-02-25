require 'spec_helper'
 
describe 'redis', :type => :class do

  it { should create_class('redis') }
  it { should include_class('ruby::redis') }

end
