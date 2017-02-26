class Cart < ActiveRecord::Base

  belongs_to  :user
  has_one   :products

  def edit
  end

  def index

  end


  def show
  end

end
