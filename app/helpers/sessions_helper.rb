module SessionsHelper
  def remember(user)
    user.remember
    session[:user_id] = user.id
    session[:remember_token] = user.remember_token
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = session[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(session[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    user.forget
    session.delete(:user_id)
    session.delete(:remember_token)
  end
end
