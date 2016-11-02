# app/controllers/passwords_controller.rb
class SessionsController < Devise::SessionsController
  add_breadcrumb "MASSDUMP", :root_path
  add_breadcrumb "LOG IN", :new_user_session_path
end