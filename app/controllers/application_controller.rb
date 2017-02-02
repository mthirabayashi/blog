class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    debugger
  end

  def login(user)
    @current_user = user
    if @current_user.username == 'guest'
      session[:session_token] = user.session_token
    else
      session[:session_token] = user.reset_session_token!
    end
  end

  def logout
    @current_user.reset_session_token!
    session[:session_token] = nil
  end
end
