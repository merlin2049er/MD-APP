class RegistrationsController < Devise::RegistrationsController
 
  add_breadcrumb "MASSDUMP", :root_path
  add_breadcrumb  "sign up", :new_user_registration
  
 
  def edit
   add_breadcrumb "profile"
  end
 

 private
 def sign_up_params
 params.require(:user).permit(
 :email,
 :password,
 :password_confirmation,
 :username,
 :firstname,
 :lastname,
 :address1,
 :address2,
 :city,
 :state,
 :postal
 
 )
 end
 def account_update_params
 params.require(:user).permit(
 :email,
 :password,
 :password_confirmation,
 :current_password,
 :username,
 :firstname,
 :lastname,
 :address1,
 :address2,
 :city,
 :state,
 :postal
 )
 end
end
