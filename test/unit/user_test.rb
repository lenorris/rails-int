require 'test_helper'

class UserTest < ActiveSupport::TestCase

  context "user instance" do
    
    subject { Factory(:user) }
    
    should validate_presence_of   :email
    should validate_uniqueness_of :email
    
  end
  
end
