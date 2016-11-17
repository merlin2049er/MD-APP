class ModalController < ApplicationController
  
  add_breadcrumb "MASSDUMP", :root_path
#  add_breadcrumb "contacts", :contact_path
#  add_breadcrumb "about", :about_path
#  add_breadcrumb "error", :error_path
  
  def index
    
  end


  def add_to_cart 
     add_breadcrumb "add to cart"
    
  end
  
end
