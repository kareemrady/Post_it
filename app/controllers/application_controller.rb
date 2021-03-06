class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :access_denied, :category_view



  def current_user
  	@current ||= User.find(session[:user_id]) if session[:user_id]
  end



  def logged_in?
  	!!current_user

  end

def require_user
      unless logged_in?
        flash[:error] = "You must login to perform this action"
        redirect_to root_path
      end
    end

    def access_denied

      flash[:error] = "You are not allowed to perform this action"
      redirect_to root_path
    end

      

    
end
