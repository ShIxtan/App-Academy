module ApplicationHelper
  def auth_token
    string = <<-HTML
    <input type="hidden"
    name="authenticity_token"
    value="<%= form_authenticity_token %>">
    HTML

    string.html_safe
  end
end
