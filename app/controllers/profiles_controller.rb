class ProfilesController < ApplicationController
  authorize_resource class: 'User'

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to job_openings_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
