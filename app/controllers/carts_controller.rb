class CartsController < ApplicationController

  include Pagy::Backend


  before_action :set_carts, only: [:create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  add_breadcrumb "MASSDUMP", :root_path


  # GET /articles
  # GET /articles.json
  def index

     add_breadcrumb "shopping cart", carts_path

     @carts  = Cart.where('user_id =?', current_user.id)
     @pagy, @carts = pagy(@carts)

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

  def create

    @cart = Cart.new

    respond_to do |format|
      if @cart.save(carts_params)
        format.html { redirect_to @carts, notice: 'Product has been added to cart.' }
        format.json { render :show, status: :created, location: @carts_path }
      else
        format.html { render :new }
        format.json { render json: @carts.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    cart = Cart.find(params[:id])
    cart.update!(qty: params[:qty])
    redirect_to carts_path
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

    def carts_params
      # params.fetch(:product, {})
      # added qty
      params.require(:cart).permit(:qty  )

    end

end
