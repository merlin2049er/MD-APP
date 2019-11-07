class TaxesController < ApplicationController
  include Pagy::Backend

  # before_action :set_taxes, only: %i[show edit update destroy]
  before_action :authenticate_user!

  add_breadcrumb 'MASSDUMP', :root_path

  def index
    add_breadcrumb 'Taxes', taxes_path

    @taxes = Tax.count

    @pagy, @taxes = pagy(Tax.all)
  end

  def show
    add_breadcrumb 'Taxes', taxes_path
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_taxes
    @taxes = Tax.find(params[:id])
  end

end
