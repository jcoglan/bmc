class SessionsController < ApplicationController
  
  def new
    render :template => 'sessions/login_form'
  end
  
  def create
    @user = User.find_by_username(params[:username])
    
    unless @user
      flash[:error] = "Unknown user '#{params[:username]}'"
      return redirect_to(:action => 'new')
    end
    
    unless @user.has_password?(params[:password])
      flash[:error] = "Incorrect password"
      return redirect_to(:action => 'new')
    end
    
    log_in(@user)
    redirect_to root_path
  end
  
  def destroy
    log_out
    redirect_to root_path
  end
  
end

