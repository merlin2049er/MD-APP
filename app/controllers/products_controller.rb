class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "MASSDUMP", :root_path
  
  # GET /products
  # GET /products.json
  def index
   
   # @search = Product.search(params[:search])
   
    add_breadcrumb "products", products_path
    
    #ransack
    @search = Product.where('draft' => false, 'active' => true).search(params[:q])
    @products = @search.result.paginate(page: params[:page] , per_page: 10)
      
    # @products = Product.all
    
    # @products = @search.all
    
    #paginate
    #@product = Product.paginate(:page => params[:page], per_page: 10)
    #Product.paginate(:page => params[:page], per_page: 10)
    
    
    
  end

  # GET /products/1
  # GET /products/1.json
  def show
    add_breadcrumb "product", products_path
     commontator_thread_show(@product)
    
    impressionist(@product)
    
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      # params.fetch(:product, {})
      # added qty 
        params.require(:product).permit(:title, :picurl, :template, :price, :msrp, :Startdate, :enddate, :draft, :active, :funded, :category_id, :qty  )
        
    end
    
    
    def add_to_cart
      # flash message here... add to cart
      render (layout/small_modal)
      
    end
    
    
    
end
