class Admin::SubmissionsController < AdminController
  load_and_authorize_resource

  def admin_contact
    @submission.admin_contacts_candidate!
    redirect_to :back
  end

  def admin_hired
    @submission.admin_hires_candidate!
    redirect_to :back
  end

  def admin_interview
    @submission.admin_interviews_candidate!
    redirect_to :back
  end

  def admin_reject
    @submission.admin_reject!
    redirect_to :back
  end
end
