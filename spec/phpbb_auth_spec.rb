require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/phpbb_auth'

describe PhpbbAuth do
  include PhpbbAuth
  
  before(:each) do
    @user = PhpbbUser.create!(valid_PhpbbUser_attributes)
    @session = PhpbbSession.create!(valid_PhpbbSession_attributes(:session_user_id => @user.user_id))     
  end
  
  describe "current_user" do
    it "should return nil if I don't have a session cookie at all" do
      self.stub!(:cookies).and_return({})
      current_user.should be_nil
    end
    
    it "should return nil if the session is not recognised by the db" do
      self.stub!(:cookies).and_return({'phpbb3_7uah4_sid' => '123456789'})
      current_user.should be_nil     
    end 
    
    it "should create and return a user in the application database if the session is valid and a user doesn't exist" do
      self.stub!(:cookies).and_return({'phpbb3_7uah4_sid' => '2d4b5dd208b7baa6d548aea9d655b392'})
      current_user.should be_a(User)
      current_user.email.should eql("mail@nospam.co.uk")
      current_user.website.should eql("http://matthewfawcett.co.uk")
    end
    
    it "should return a user if session valid and user already exists in application database" do
      @local_user = User.create!(:email => "mail@nospam.co.uk")
      self.stub!(:cookies).and_return({'phpbb3_7uah4_sid' => '2d4b5dd208b7baa6d548aea9d655b392'})
      current_user.should == @local_user
    end
    
  end
end
