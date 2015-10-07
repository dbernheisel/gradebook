class DashboardsController < ApplicationController

  def show
    if @current_user.role == "instructor"
      student_ids = InstructorRelationship.where(instructor_id: @current_user.id).pluck(:student_id)
      @students = User.find(student_ids)
    end

    if @current_user.role == "student"
      instructor_ids = InstructorRelationship.where(student_id: @current_user.id).pluck(:instructor_id)
      @instructors = User.find(instructor_ids)
    end

    if @current_user.role == "guardian"
      student_ids = GuardianRelationship.where(instructor_id: @current_user.id).pluck(:student_id)
      @students = User.find(student_ids)
    end
  end

    # Only allow a trusted parameter "white list" through.
    # def user_params
    #   params.require(:user).permit(:email, :role, :password_digest)
    # end
end
