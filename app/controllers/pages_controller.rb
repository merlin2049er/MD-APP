class PagesController < ApplicationController
  
  add_breadcrumb "MASSDUMP", :root_path
#  add_breadcrumb "contacts", :contact_path
#  add_breadcrumb "about", :about_path
#  add_breadcrumb "error", :error_path
  
  def index
    add_breadcrumb "home", index_path
  end

  def contact
     add_breadcrumb "contact", contact_path
  end

  def about
     add_breadcrumb "about", about_path
  end
  
  def error 
     add_breadcrumb "error", error_path
  end
  
  def terms 
     add_breadcrumb "terms", terms_path
  end
  
  
end
