class SubmissionsController < ApplicationController
  load_and_authorize_resource

  def create
    if @submission.save
      flash[:notice] = 'Application created successfully.'
      redirect_to job_openings_path
    else
      flash.alert = "Application was not created!"
      redirect_to job_openings_path
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :job_opening_id, :aasm_state)
  end
end
