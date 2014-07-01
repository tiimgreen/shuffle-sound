module ApplicationHelper
  def full_title(title, base = 'Sound Shuffle')
    (title.empty? ? base : "#{title} | #{base}").html_safe
  end
end
