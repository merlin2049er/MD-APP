# frozen_string_literal: true

class ConfirmationsController < Devise::ConfirmationsController
  add_breadcrumb 'MASSDUMP', :root_path
  add_breadcrumb 'CONFIRMATION', :user_confirmation_path

  private

  def after_confirmation_path_for(_pages, _index)
    new_user_session_path
  end
end
