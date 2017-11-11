class AddQtyToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :qty, :integer

  end
end
