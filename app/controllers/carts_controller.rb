class CartsController < ApplicationController
    
  before_action :set_carts, only: [:show]
  before_action :authenticate_user!

  # GET /articles
  # GET /articles.json
  def index
    @Carts = Cart.all
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      #
    end
    
end
