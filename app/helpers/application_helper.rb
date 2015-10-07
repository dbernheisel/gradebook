module ApplicationHelper

  def instructor?(user = @current_user)
    user.role.downcase == "instructor"
  end

  def guardian?(user = @current_user)
    user.role.downcase == "guardian"
  end

  def student?(user = @current_user)
    user.role.downcase == "student"
  end

end
