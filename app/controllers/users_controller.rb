class UsersController < ApplicationController
	def index
		@users = User.all
    end

    def new
    	@user = User.new
    end

    def show
    	 @user = User.find(params[:id])
         # debugger
    end

    def create
    	@user = User.new users_params
    	if @user.save
    		flash[:success]= "Register Success Users"
    		redirect_to users_path
    	else
    	    flash[:success]= "Register Fails"
    	    render :new
    	end
    end

    def edit
    	@user = User.find(params[:id])
    end

    def update
    	@user = User.find(params[:id])
    	if @user.update_attributes(users_params)
    	   flash[:success]= "Update successfull"
    	   redirect_to users_path
    	else
    		flash[:success]= "Update Fails"
    		render :edit
    	end
    end

    def destroy
    	
    end
    private
    def users_params
       params.require(:user).permit :name, :email, :password, :password_confirmation
    end
end
