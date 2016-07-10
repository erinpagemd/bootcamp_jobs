class JobOpeningDecorator < Draper::Decorator
  delegate_all

  def active_applications
    return "" unless object.submissions.any?
    "#{object.submissions.active.count} active applications"
  end

  def application_count
    return "No applications" unless object.submissions.any?
    "#{object.submissions.try(:count)} applications"
  end

  def hired_applicant
    return "" unless object.submissions.hired.any?
    "***HIRED APPLICANT***"
  end
end
