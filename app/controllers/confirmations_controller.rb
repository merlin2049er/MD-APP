class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(pages, index)
    your_new_after_confirmation_path
  end
end