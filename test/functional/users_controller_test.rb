require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  context 'sign up' do
    
    should "show the new user page" do
      get :new
      assert assigns(:user)
      assert assigns(:user).new_record?
    end
    
    
    should "create a user when given valid parameters" do
      assert_difference "User.count", +1 do
        post :create, user: {email: 'mikko@trololo.com', password: 'trololo', password_confirmation: 'trololo'}
        assert_response :redirect
        assert_redirected_to root_path
      end
    end

    should "not create a user when given invalid parameters" do
      assert_no_difference "User.count" do
        post :create, user: {password: 'trololo', password_confirmation: 'trololo'}
        assert_response :success
        assert_template :new
        assert assigns(:user)
        assert assigns(:user).invalid?
      end
    end

  end

end
