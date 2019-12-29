# frozen_string_literal: true

# app/controllers/passwords_controller.rb
class PasswordsController < Devise::PasswordsController
  #add_breadcrumb 'MASSDUMP',  :root_path
  add_breadcrumb 'FORGOT', :contacts_path
end
