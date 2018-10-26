class InvoicingController < ApplicationController
  include Pagy::Backend

  def index
    add_breadcrumb "invoicing", invoicing_path


    @totalinvoices = Cart.where('processing' => true ).count
    @invoiceusers = Cart.includes(:user).where('processing' => true )

    @pagy, @invoiceusers = pagy(@invoiceusers)
  end

    def update #create a route for this?
      cart = Cart.find(params[:id])

      respond_to do |format|
        if @cart.update_attributes(params[:cart])
           format.html { redirect_to invoicing_path, notice: 'Invoice was successfully updated.' }
           format.json { head :no_content }
             else
          format.json { render json: @cart.errors, status: :unprocessable_entity }
        end
      end

    end

end
