# frozen_string_literal: true

class NotificationsController < ApplicationController
  include Pagy::Backend

  before_action :set_notification, only: %i[show edit update destroy]
  before_action :authenticate_user!


  # GET /notifications
  # GET /notifications.json
  def index
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'notifications', :notifications_path

    @notifications = Notification.where('user_id =?', current_user.id).order('created_at DESC')
    @pagy, @notifications = pagy(@notifications)
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'notification', :notifications_path
  end

  # GET /notifications/new
  def new
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'notification', :notifications_path
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'notification', :notifications_path
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notification
    @notification = Notification.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def notification_params
    # params.fetch(:notification, {})
    params.require(:notification).permit(:notify_msg, :user_id)
  end
end
