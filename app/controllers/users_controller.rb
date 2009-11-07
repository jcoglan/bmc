class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(params[:user])
    return unless @user.save
    log_in(@user)
    flash[:message] = "Welcome, #{@user.username}!"
    redirect_to root_path
  end
  
end

