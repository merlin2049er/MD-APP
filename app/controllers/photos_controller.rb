# frozen_string_literal: true

class PhotosController < ApplicationController
  include Pagy::Backend

  before_action :set_photos, only: %i[show edit update destroy]
  before_action :authenticate_user!

  add_breadcrumb 'MASSDUMP', :root_path

  def index
    add_breadcrumb 'Photos', photos_path

    @total = Photo.count
    @pagy, @photos = pagy(Photo.all)
  end

  def show
    add_breadcrumb 'Photos', photos_path
  end

  def new
    add_breadcrumb 'Photos', photos_path
    @photo = Photo.new
  end

  def edit
    add_breadcrumb 'Photos', photos_path
  end

  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Product image was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Product image was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Product image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_photos
    @photo = Photo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_params
    # params.fetch(:product, {})
    # added qty
    params.require(:photo).permit(:uri, :enabled, :product_id)
  end
end
