class BackingsController < ApplicationController
  def create
    @backing = Backing.create(backings_params)
    if @backing.save
      redirect_to root_path
      flash[:success] = "Backing Saved"
    else
      flash[:warning] = "Unable to back product"
      render :show
    end
  end

  private

  def backings_params
    params.require(:backing).permit(:qty, :user_id, :product_id)
  end
end
