class Admin::SubmissionsController < AdminController
  load_and_authorize_resource

  def admin_reject
    @submission.admin_reject!
    redirect_to :back
  end
end
