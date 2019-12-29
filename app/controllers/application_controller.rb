# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #add_breadcrumb 'MASSDUMP', :root_path

  # include PubicActivity::StoreController

  helper_method :all_categories
  helper_method :all_products
  helper_method :all_notifications

  before_action :store_history
  before_action :set_search

  # not being used...
  #  auto_session_timeout 10.minutes  # 10 minutes to test, 30 minutes for production
  # before_timedout_action

  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_token_issues

  def handle_token_issues
    redirect_to(root_path) # redirect to page for handling this issue
  end

  def set_search
    @search = Product.published.search(params[:q])
  end

  def all_categories
    @categories = Category.all
    @categories = Category.order(:name)
  end

  def all_products
    @products = Product.all
  end

  def all_notifications
    @notifications = Notification.where('user_id =?', current_user.id).order('created_at DESC').limit(10)
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

  def store_history
    session[:history] ||= []
    session[:history].delete_at(0) if session[:history].size >= 5
    session[:history] << request.url
  end

  protected

  # override before_timedout
  # not being used >>
  # def before_timedout
  # your custom code here
  # end
end
