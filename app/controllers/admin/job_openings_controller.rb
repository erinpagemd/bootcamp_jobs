class Admin::JobOpeningsController < AdminController

  def index
    @job_opening = JobOpening.new
    @job_openings = JobOpening.all
  end

  def create
    @job_opening = JobOpening.new(job_opening_params)
    if @job_opening.save
      flash[:notice] = 'Job Opening created successfully.'
      redirect_to admin_job_openings_path
    else
      flash.alert = "Job Openings was not created!"
      redirect_to admin_job_openings_path
    end
  end

  private

  def job_opening_params
    params.require(:job_opening).permit(:name, :description)
  end
end
