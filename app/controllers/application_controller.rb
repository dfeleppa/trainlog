class ApplicationController < ActionController::Base
    # before_action :redirect_if_not_logged_in

    helper_method :current_user, :logged_in?, :is_coach?
  
  
    private
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def redirect_if_not_logged_in
      redirect_to login_path if !logged_in?
    end

    def is_coach?
        if current_user.coach
        end
    end

end