class SubmissionDecorator < Draper::Decorator
  delegate_all

  def applicant_email
    "#{object.user.email}"
  end

  def applicant_name
    return "Some Anonymous Applicant" unless object.user && object.user.first_name || object.user.last_name
    "#{object.user.try(:first_name)} #{object.user.try(:last_name)}"
  end

  def applied_date_message
    return "Information not available" unless object.created_at
    "Applied on " + object.created_at.strftime("%A, %B %e, %Y")
  end

  def job_name
    object.try(:job_opening).try(:name) || "Some Job"
  end

  def without_phone_numbers
    "Applicant did not enter phone number" if object.user.phone_numbers.empty?
  end
end
