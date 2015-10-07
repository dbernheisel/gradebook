class DashboardsController < ApplicationController

  def show
    # @assignments = Assignment.where('instructor_id = ? OR student_id = ?', [@current_user.id, @current_user.id])

  end

    # Only allow a trusted parameter "white list" through.
    # def user_params
    #   params.require(:user).permit(:email, :role, :password_digest)
    # end
end
