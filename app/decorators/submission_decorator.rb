class SubmissionDecorator < Draper::Decorator
  delegate_all

  def applied_date_message
    return "Information not available" unless object.created_at
    "Applied on " + object.created_at.strftime("%A, %B %e, %Y")
  end
end
