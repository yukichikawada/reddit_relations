class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def logged_in?
    !!current_user
  end

  def current_user
      @current_user ||= User.find_by(session_token: session[:token])
  end

  def login(user)
    @current_user = user
    @current_user.session_token = user.reset_token
  end

  def logout
    current_user.reset_token
    session[:session_token] = nil
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end
end
