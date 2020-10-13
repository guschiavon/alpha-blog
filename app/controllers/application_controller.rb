class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? #this makes the method available to the views and not only to the controller
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
