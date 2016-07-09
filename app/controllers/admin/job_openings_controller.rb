class Admin::JobOpeningsController < AdminController
  load_and_authorize_resource

  def index
    @job_opening = JobOpening.new
    @job_openings = JobOpeningDecorator.decorate_collection(@job_openings)
  end

  def create
    if @job_opening.save
      flash[:notice] = 'Job Opening created successfully.'
      redirect_to admin_job_openings_path
    else
      flash.alert = "Job Opening was not created!"
      redirect_to admin_job_openings_path
    end
  end

  def show
    @submissions = SubmissionDecorator.decorate_collection(@job_opening.submissions.decorate)
  end

  private

  def job_opening_params
    params.require(:job_opening).permit(:name, :description)
  end
end
