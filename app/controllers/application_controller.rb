class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :all_categories
  helper_method :all_products
  helper_method :all_notifications
  
 
  def all_categories
      @categories = Category.all
  end
  
  def all_products
    @products = Product.all
  end 
  
  def all_notifications
    @notifications = Notification.all
  end 

end
