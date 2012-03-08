require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  context 'login' do
    
    setup do
      @user = Factory(:user)
    end
    
    should "show the login page" do
      get :new
      assert_response :success
    end
    
    should "login when given correct credentials" do
      post :create, email: @user.email, password: Factory.attributes_for(:user)[:password]
      
      assert_response :redirect
      assert_redirected_to root_path
      assert session[:user_id]
      assert_equal @user.id, session[:user_id]
    end
    
    should "not login with nonexisting user" do
      post :create, email: 'non_existant@us.er', password: Factory.attributes_for(:user)[:password]
      
      assert_response :success
      assert_template :new
      assert session[:user_id].nil?
    end
    
    should "not login when given invalid password" do
      post :create, email: @user.email, password: 'invalid_password'

      assert_response :success
      assert_template :new
      assert session[:user_id].nil?
    end
    
  end
  
  context 'logout' do
    
    setup do
      session[:user_id] = Factory(:user).id
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
    
    should "return logged in user if there is one" do
      session[:user_id] = @user.id
      
      assert_equal @controller.send(:current_user), @user
    end
    
    should "return nil if there is no logged in user" do
      
      assert @controller.send(:current_user).nil?
    end
      
  end
  
end
