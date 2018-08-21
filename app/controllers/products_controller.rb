class ProductsController < ApplicationController
  include Pagy::Backend

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter  :authenticate_user!

  add_breadcrumb "MASSDUMP", :root_path

  # GET /products
  # GET /products.json
  def index

    # @search = Product.search(params[:search])

    add_breadcrumb "products", products_path

    @total_products = Product.count

    require 'time'

    todaydate = Time.new
#    set 'todaydate' equal to the current date/time.

    todaydate = todaydate.year.to_s + "-" + todaydate.month.to_s + "-" + todaydate.day.to_s



#ransack
    @search = Product.where( 'draft' => false,  'active' => true, 'funded' => false).where( 'enddate > ?', todaydate ).search(params[:q])
    @searchtotal = @search.result.count
    @pagy, @products = pagy( @search.result)

  end

  # GET /products/1
  # GET /products/1.json
  def show
    add_breadcrumb "product", products_path
     commontator_thread_show(@product)

    impressionist(@product)

    @photo = Photo.where('enabled' => true ).where('product_id' => @product)

    # @taken = Cart.where('product_id' => @product).count
    @taken = Cart.where('product_id' => @product).sum(:qty)
    @remaining = @product.qty - @taken

    if @remaining == 1
      flash.now[:warning]= 'This is the last remaining product required to complete the group order.  By adding it to your cart, it will complete the order for the campaign.'

    end

    # start a REPL session
    #binding.pry

     #if @remaining == 0 and @product.funded == 'false'

       #product =  Product.find_by( id: params[:id])

    #    @product.funded = 'true'  # - this works...
    #   @product.valid? # returns false
    #   @product.errors.messages # returns something like {email: "Cant be blank"}
    #   @product.save   # - this works...

       # Product.update(params[:product_id], :funded => true)
       #   cart = Cart.where(:product_id => params[:product_id]).update_all(:processing => true)
       # cart.valid? # returns false
       # cart.errors.messages
       # cart.save

     # end

  end

  # GET /products/new
  def new
    add_breadcrumb "product", products_path
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    add_breadcrumb "product", products_path
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def add_to_cart


   if Cart.where( user_id: current_user.id, product_id: params[:id]).blank?

    @cart = Cart.new(user_id: current_user.id, product_id: params[:id], qty: params[:qty] )



    respond_to do |format|
      if @cart.save

        #  if @remaining == 0  # not seeing this variable


        # Product.update(params[:product_id], :funded => true)
        #  Cart.where(:product_id => params[:product_id]).update_all(:processing => true)
        #  end


        format.html { redirect_to :back, notice: 'Product was successfully added to cart.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end

else

   cart =  Cart.find_by( user_id: current_user.id, product_id: params[:id])

   temp = cart.qty
   cart.qty = params[:qty].to_i + temp #  plus cart.qty
   cart.save

  respond_to do |format|
    format.html { redirect_to :back, notice: 'Product was successfully updated in cart.' }
    format.json { render json: @cart.errors, status: :unprocessable_entity }
  end
end


  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      # params.fetch(:product, {})
      # added qty
        params.require(:product).permit( :title, :picurl, :template, :price, :msrp, :startdate, :enddate, :draft, :active,  :category_id, :qty, :length, :width, :height, :weight, :courier, :courierurl  )

    end


  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    # params.fetch(:cart, {})
    params.require(:cart).permit(:user_id, :product_id, :qty)
  end

end
