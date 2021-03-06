class SessionsController < ApplicationController
    # skip_before_action :redirect_if_not_logged_in
    
    def index
    end

    def new
    end
  
    def create
       @user = User.find_by(email: params[:user][:email])
   
       if @user && @user.authenticate(params[:user][:password])
          flash[:success] = "Login Successful!"
         session[:user_id] = @user.id
         redirect_to user_path(@user.id)
       else
          flash[:danger] = "Incorrect login information"
          redirect_to new_session_path
       end
    end
  
  
    def oauth_login
      @user = User.from_omniauth(auth)
      @user.save
      session[:user_id] = @user.id
     redirect_to user_path(@user.id)
    end
  
    def destroy
      session.clear
      redirect_to root_path
    end
  
  
    private
  
      def auth
      request.env['omniauth.auth']
    end
  end