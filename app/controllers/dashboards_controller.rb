class DashboardsController < ApplicationController
  before_action :set_user, only: [:show]

  def show

  end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    # def user_params
    #   params.require(:user).permit(:email, :role, :password_digest)
    # end
end
