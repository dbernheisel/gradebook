module SessionsHelper
  def remember(user)
    user.remember
    session[:user_id] = user.id
    session[:remember_token] = user.remember_token
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user_user ||= User.find(user_id)
      case @current_user_user.role
      when "instructor"
        @current_user = Instructor.find(user_id)
      when "guardian"
        @current_user = Guardian.find(user_id)
      when "student"
        @current_user = Student.find(user_id)
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
