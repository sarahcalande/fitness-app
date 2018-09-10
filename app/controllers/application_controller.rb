class ApplicationController < ActionController::Base
  helper_method :logged_in?
  def current_user
    if session[:current_user_id]
      @user = User.find(session[:current_user_id])
    end
  end
end

def logged_in?
  !!current_user
end
