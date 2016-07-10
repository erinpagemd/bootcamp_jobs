class UserDecorator < Draper::Decorator
  delegate_all

  def name
    return "Profile Incomplete" unless object.first_name || object.last_name
    "#{object.first_name} #{object.last_name}"
  end

  def without_phone_numbers
    h.content_tag(:h4, "Please enter contact information") if object.phone_numbers.empty?
  end
end
