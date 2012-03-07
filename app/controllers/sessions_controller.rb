class SessionsController < ApplicationController
  
  skip_before_filter :authorize, only: [:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Email or password is invalid"
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to new_session_path
  end
  
  
end
