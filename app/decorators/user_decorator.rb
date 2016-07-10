class UserDecorator < Draper::Decorator
  delegate_all

  def name
    return "Profile Incomplete" unless object.first_name || object.last_name
    "#{object.first_name} #{object.last_name}"
  end
end
