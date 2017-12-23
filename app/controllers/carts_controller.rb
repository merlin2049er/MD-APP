class CartsController < ApplicationController
  before_action :set_carts, only: [:create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  add_breadcrumb "MASSDUMP", :root_path

  # GET /articles
  # GET /articles.json
  def index
    add_breadcrumb "shopping cart", carts_path 

    @carts  = Cart.where('user_id =?', current_user.id)
    @carts = @carts.paginate(page: params[:page] , per_page: 10)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @cart = Cart.new
  end

  # GET /articles/1/edit
  def edit
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Item in cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_carts
    @cart = Cart.find(params[:id])
  end
end
