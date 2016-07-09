class JobOpeningDecorator < Draper::Decorator
  delegate_all

  def applicant_count
    return "No applicants" unless object.submissions.any?
    "#{object.submissions.try(:count)} applicants"
  end

end
