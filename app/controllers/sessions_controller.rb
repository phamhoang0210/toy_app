class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create,:new]
  def new

  end

 
  def create
  	# byebug
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	log_out
    flash[:success] = "You are logged out"
    redirect_to login_path
  end
end
