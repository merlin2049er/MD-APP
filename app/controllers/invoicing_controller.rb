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
      cart.update!(invoice: params[:invoice])
      redirect_to invoicing_path
    end

end
