class HomeController < ApplicationController
  before_action :user_redirect

  def index
  end

  def user_redirect
    return unless current_user
    if current_user.type == "Admin"
      redirect_to admin_job_openings_path
    end
  end

end
