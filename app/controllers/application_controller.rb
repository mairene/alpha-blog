class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    # return user of user_id if there is a user_id stored in session hash
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
    # return true if there is a current user, will return false if otherwise
  end

  def require_user
    if !logged_in?
      flash[:danger] = 'You  must be logged in to perform that action'
      redirect_to root_path
    end
  end

  def get_destinations
    @dests_for_pins = Destination.all
  end
end
