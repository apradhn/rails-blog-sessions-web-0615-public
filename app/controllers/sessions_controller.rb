class SessionsController < ApplicationController

  def new
    
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to root_path, notice: "Hello, #{@user.name}!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged Out"
  end

  private
  def login(user)
    session[:user_id] = user.id
  end

end
