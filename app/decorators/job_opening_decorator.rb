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
end
