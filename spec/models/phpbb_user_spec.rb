require File.dirname(__FILE__) + '/../spec_helper'

describe PhpbbUser do
  before(:each) do
    @phpbb_user = PhpbbUser.new
  end

  it "should be valid" do
    @phpbb_user.should be_valid
  end
end
