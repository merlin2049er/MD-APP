class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # include PubicActivity::StoreController
  
  helper_method :all_categories
  helper_method :all_products
  helper_method :all_notifications

  before_filter :set_search

  def set_search
    @search=Product.search(params[:q])
  end
 
  def all_categories
      @categories = Category.all
      @categories = Category.order(:name)
  end
  
  def all_products
    @products = Product.all
  end 
  
  def all_notifications
     @notifications = Notification.where("user_id =?", current_user.id)


  end

  rescue_from ActiveRecord::RecordNotFound, with: :show_errors
 
  
  def show_errors
     render 'pages/error'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_notifications
    @notifications = Notifications.find(params[:id])

  end

end