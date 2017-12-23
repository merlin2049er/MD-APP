class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  add_breadcrumb 'MASSDUMP', :root_path
  # GET /transactions
  # GET /transactions.json
  def index
    add_breadcrumb 'transactions', transactions_path
    # @transactions = Transaction.all
    @transactions = Transaction.where('user_id =?', current_user.id).order('created_at DESC').paginate(page: params[:page] , per_page: 10)
    @transactions = @transactions.paginate(page: params[:page] , per_page: 10)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    add_breadcrumb 'transaction', transactions_path
  end

  # GET /transactions/new
  def new
    add_breadcrumb 'transaction', transactions_path
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    #params.fetch(:transaction, {})
    params.require(:transaction).permit(:transaction_msg , :user_id , 
      :invoice_number, :tracking_number, :shipped, :postal_carrier )
  end
end
