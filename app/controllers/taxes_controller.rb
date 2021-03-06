class TaxesController < ApplicationController
  include Pagy::Backend

  # before_action :set_taxes, only: %i[show edit update destroy]
  before_action :authenticate_user!


  def index
    add_breadcrumb 'MASSDUMP',  :'root_path'
    add_breadcrumb 'Taxes', :taxes_path

    @taxes = Tax.count

    @pagy, @taxes = pagy(Tax.all.order(:prov_id))
  end

  def show
    add_breadcrumb 'MASSDUMP',  :'root_path'
    add_breadcrumb 'Taxes', :taxes_path
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_taxes
    @taxes = Tax.find(params[:id])
  end

end
