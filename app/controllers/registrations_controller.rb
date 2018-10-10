class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.


  add_breadcrumb "MASSDUMP", :root_path
  #add_breadcrumb  "sign up", :new_user_registration
  add_breadcrumb "sign up", nil


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
 :postal,
 :country

 )
 end
 def account_update_params
 params.require(:user).permit(
 :email,
 :password,
 :password_confirmation,
 #:current_password,
 :username,
 :firstname,
 :lastname,
 :address1,
 :address2,
 :city,
 :state,
 :postal,
 :country
 )
 end


   def check_captcha
     unless verify_recaptcha
       self.resource = resource_class.new sign_up_params
       resource.validate # Look for any other validation errors besides Recaptcha
       set_minimum_password_length
       respond_with resource
     end
   end

 
 protected

 def update_resource(resource, params)
   resource.update_without_password(params)
 end

end
