require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
 
  context "login" do
  
    setup do
      @user = Factory(:user)
    end
    
    should "show the login page" do
      get :new
      assert_response :success
    end
    
    should "log in when given correct credentials" do
      post :create, email: @user.email, password: 'infopass'
      
      assert_response :redirect
      assert_redirected_to root_path
      
      assert session[:user_id]
    end
    
    should "log in with a non-existing user" do
      post :create, email: 'no.such@user', password: 'huh'
      
      assert_response :success
      assert_template :new
      
      assert session[:user_id].nil?
    end
    
    should "not login when given an invalid password" do
      post :create, email: @user.email, password: 'evil'
      
      assert_response :success
      assert_template :new
      
      assert session[:user_id].nil?
    end
    
  end
  
  context "logout" do
    
    setup do
      session[:user_id] = Factory(:user)
    end
    
    should "log out" do
      delete :destroy
      
      assert_response :redirect
      assert_redirected_to new_session_path
      assert session[:user_id].nil?
    end
    
  end
  
  context "current_user" do
    
    setup do
      @user = Factory(:user)
    end
    
    should "return the logged in user when logged in" do
      session[:user_id] = @user.id
      
      assert_equal @controller.send(:current_user), @user
    end
    
    should "return nil when not logged in" do
      assert @controller.send(:current_user).nil?
    end
    
  end
  
  
end
