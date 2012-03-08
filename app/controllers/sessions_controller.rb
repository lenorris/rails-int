class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      reset_session
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
