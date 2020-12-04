class UsersController < ApplicationController
    def index
        @users = User.all
    end 
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to show_path(@user)
        else
            render :new
        end
    end
    
    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end