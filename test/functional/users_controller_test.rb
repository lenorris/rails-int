require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  context "sign up" do
  
    should "show the new user page" do
      get :new
      assert assigns(:user)
      assert assigns(:user).new_record?
    end
    
    should "create a user when given valid parameters" do
      assert_difference "User.count", +1 do
        post :create, user: {email: 'jane@company.com',
                             password: 'catsanddogs',
                             password_confirmation: 'catsanddogs'}
        assert_response :redirect
        assert_redirected_to root_path
        assert flash[:notice]
      end
    end
    
    should "not create a user when given invalid parameters" do
      assert_difference "User.count", 0 do
        post :create, user: {password: 'catsanddogs',
                             password_confirmation: 'catsanddogs'}
        assert_response :success
        assert_template :new
        assert assigns(:user)
        assert !assigns(:user).valid?
      end
    end
    
  end

end
