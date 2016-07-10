class UsersController < ApplicationController
  load_and_authorize_resource

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to job_openings_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
