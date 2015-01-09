class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!(user)
    session[:session_token] = nil
    user.reset_session_token!
  end

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?(user)
    user.session_token == session[:session_token]
  end

  def require_login
    redirect_to new_session_url unless current_user
  end
end
