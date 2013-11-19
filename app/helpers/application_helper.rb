module ApplicationHelper

  def user_login_span_tag(user = nil)
    if user
      str = <<-HTML
      <div>
        <span>#{user.email} |<span>
        <span>#{link_to("Log out", destroy_user_session_path, :method => :delete)}</span>
      </div>
      HTML
    else
      str = <<-HTML
      <div>
        <span>#{link_to("Log in", new_user_session_path)}<span> |
        <span>#{link_to("Register", new_user_registration_path)}</span>
      </div>
      HTML
    end
    raw str
  end

end
