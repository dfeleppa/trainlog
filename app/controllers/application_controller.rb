class ApplicationController < ActionController::Base
    # before_action :redirect_if_not_logged_in
    add_flash_types :info, :error, :warning
    helper_method :current_user, :logged_in?, :coach?, :admin?
   
  
  
    private
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def redirect_if_not_logged_in
      redirect_to new_session_path if !logged_in?
    end

    def coach?
        if current_user.coach == 1
        end
    end

    def admin?
      current_user.admin
    end

end