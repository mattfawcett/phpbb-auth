require File.dirname(__FILE__) + '/../spec_helper'

describe PhpbbSession do
  before(:each) do
    PhpbbSession.delete_all
    PhpbbUser.delete_all
  end
  
  it "should connect to the correct database to return a session row" do
    PhpbbSession.create!(valid_PhpbbSession_attributes)
    @session = PhpbbSession.find_by_session_id('2d4b5dd208b7baa6d548aea9d655b392')
    @session.session_user_id.should eql(1) #guest user  
  end
  
  it "should return a user for a particular session if they are logged in" do
    @user = PhpbbUser.create!(valid_PhpbbUser_attributes)
    PhpbbSession.create!(valid_PhpbbSession_attributes(:session_user_id => @user.user_id))    
    @session = PhpbbSession.find_by_session_id('2d4b5dd208b7baa6d548aea9d655b392')
    @session.phpbb_user.username.should eql("matt")
  end
  


  describe PhpbbSession, ".logged_in?" do
    before(:each) do
      @session = PhpbbSession.new
    end
    
    it "should return true when my session_user_id is > 1" do
      @session.session_user_id = 20
      @session.should be_logged_in
    end
    
    it "should return false when my session_user_id is <= 1" do
      @session.session_user_id = 1
      @session.should_not be_logged_in
    end
    
  end
end

