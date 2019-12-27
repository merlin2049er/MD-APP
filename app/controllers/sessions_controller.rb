# frozen_string_literal: true

# app/controllers/passwords_controller.rb
class SessionsController < Devise::SessionsController
  # add_breadcrumb 'MASSDUMP', :root_path
 #  add_breadcrumb 'LOG IN', :new_user_session_path

  auto_session_timeout_actions

  def active
    render_session_status
  end

  def timeout
    render_session_timeout
  end
end
