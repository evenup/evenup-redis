require 'spec_helper'

describe 'redis', :type => :class do

  it { should create_class('redis') }

end
