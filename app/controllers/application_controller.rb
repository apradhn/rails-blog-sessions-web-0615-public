class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :login_required, only: [:new]

  private

  def login_required
    if !logged_in?
      redirect_to login_path, notice: "You need to login"
    end
  end

  def logged_in?
    if session[:user_id]
      if @current_user = User.find(session[:user_id])
        true
      else
        false
      end
    else
      false
    end
  end  
  helper_method :logged_in?

  def current_user
    @current_user
  end
  helper_method :current_user  
end
