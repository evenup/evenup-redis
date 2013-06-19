require 'spec_helper'
 
describe 'redis', :type => :class do

  it { should create_class('redis') }
  it { should_not include_class('ruby::redis') }

  context "with sensu monitoring" do 
    let(:params) { { :monitoring => 'sensu' } }
    it { should include_class('ruby::redis') }
  end

end
