class CartsController < ApplicationController
    
  before_action :set_carts, only: [:create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  add_breadcrumb "MASSDUMP", :root_path


  # GET /articles
  # GET /articles.json
  def index
      
     add_breadcrumb "shopping cart", carts_path 

     @carts  = Cart.where('user_id =?', current_user.id)

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    #@article = current_user.articles.build
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

  def create

    #product_id = cart_params[:product_id]
    product_id = params['id']
    user_id = session['user_id']
    @cart = Cart.new(user_id, product_id)


    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Product was successfully added to cart.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carts
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carts_params
      params.require(:cart).permit(:name)
    end



  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    # params.fetch(:cart, {})
    params.require(:cart).permit(:user_id,  :product_id )


  end



end
