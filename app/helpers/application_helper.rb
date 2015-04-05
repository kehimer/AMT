module ApplicationHelper
  def welcome_text
      "Ya son #{User.count} usuarios registrados!!!"
  end
end
