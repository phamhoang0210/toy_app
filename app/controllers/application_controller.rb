class ApplicationController < ActionController::Base
	  protect_from_forgery with: :exception
end
#git name : origin
# micropost=Micropost.new content: "How're you", user_id: "1"