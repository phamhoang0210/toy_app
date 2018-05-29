class ApplicationController < ActionController::Base
	  protect_from_forgery with: :exception

	  #tro den ham module session_helper
	  include SessionsHelper
      # current user
	  def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	  end

      #check login
	  before_action :require_login
	  def require_login
	  	unless logger_in
	  		redirect_to login_path
	  	end
	  end
end
#git name : origin
# micropost=Micropost.new content: "How're you", user_id: "1"