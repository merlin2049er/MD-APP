# frozen_string_literal: true

class InvoicingController < ApplicationController
  before_action only: [:create]
  before_action :authenticate_user!

  include Pagy::Backend

  def index
    add_breadcrumb 'MASSDUMP',  :root_path


    add_breadcrumb "invoicing", :invoicing_index_path

  #  @totalinvoices = Cart.where('processing' => true ).count

  #  @invoiceusers = Cart.includes(:user).where('processing' => true, 'invoice'.empty?)

    @totalinvoices = Cart.where('processing' => true).count

    @invoiceusers = Cart.includes(:user).where('processing' => true)

    @pagy, @invoiceusers = pagy(@invoiceusers)
  end

  def create
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(cart_params)
        format.html { redirect_to request.referrer, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    # params.fetch(:transaction, {})
    params.permit(:invoice)
  end
end
