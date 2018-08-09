class AddFundedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :funded, :boolean
    
  end
end
