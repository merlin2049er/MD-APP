class AddStartdateToProducts < ActiveRecord::Migration
  def change
    
    add_column :products, :startdate, :datetime
     
  end
end
