class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to user, notice: 'Successful Login'
    else
      redirect_to login_path, notice: 'Invalid email/password combination'
    end
  end

  def destroy
    forget(current_user)
    log_out if logged_in?
    redirect_to root_url
  end
end
