class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      remember user
      redirect_to user_dashboard_path(user_id: user.id), flash: {notice: 'Successful Login'}
    else
      redirect_to login_path, flash: {alert: 'Invalid email/password combination'}
    end
  end

  def destroy
    forget(current_user)
    log_out if logged_in?
    redirect_to root_url
  end
end
