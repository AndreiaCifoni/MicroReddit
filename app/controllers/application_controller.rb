class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :authenticate_user!
  
  helper_method :current_user

    def set_current_user
      @user = User.new
      # finds user with session data and stores it if present
      Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
    def require_user_logged_in!
      # allows only logged in user
      redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authenticate_user!
      require_user_logged_in!
    end
end
