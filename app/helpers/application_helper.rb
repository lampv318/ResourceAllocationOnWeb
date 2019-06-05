module ApplicationHelper
  def break_the_lines(text)
    text.to_s.gsub(/\n/, '<br/>').html_safe
  end

  def logged_in?
    current_user.present?
  end
end
