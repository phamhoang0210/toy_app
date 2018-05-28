module SessionsHelper
	#login
	def log_in user
    session[:user_id] = user.id
    end
    #logout
    def log_out
    session.delete :user_id
    end

    #curent_user
    def current_user
    	@current_user ||= User.find_by id: session[:user_id]
    end

    #check user has login and before?
    def logger_in
        current_user.present?
    end

    #check login user
    def log_out
    	session.delete(:user_id)
    	current_user = nil
    end
end
