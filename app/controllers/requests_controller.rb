# frozen_string_literal: true

class RequestsController < ApplicationController
  include Pagy::Backend

  before_action :set_requests, only: %i[show edit update destroy]
  before_action :authenticate_user!

  add_breadcrumb 'MASSDUMP', :root_path

  def index
    add_breadcrumb 'Requests', requests_path

    @pagy, @requests = pagy(Request.where(enabled: true).all)
  end

  def show
    add_breadcrumb 'Requests', requests_path
  end

  def new
    add_breadcrumb 'Requests', requests_path
    @request = Request.new
  end

  def edit
    add_breadcrumb 'Requests', requests_path
  end

  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully sumbitted.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @photo, notice: 'Product image was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @request = Request.find(params[:id])
    @request.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @request = Request.find(params[:id])
    @request.downvote_by current_user
    redirect_to :back
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_requests
    @request = Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:product, :manufacturer, :producturl, :manfactureurl)
  end
end
