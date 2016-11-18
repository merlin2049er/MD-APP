class AddQtyToProducts < ActiveRecord::Migration
  def change
     # added qty 
    add_column :products, :qty, :integer
    
  end
end
