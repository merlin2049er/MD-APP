class AddStartdateToProducts < ActiveRecord::Migration
  def change
    
    add_column :products, :Startdate, :date
     
  end
end
