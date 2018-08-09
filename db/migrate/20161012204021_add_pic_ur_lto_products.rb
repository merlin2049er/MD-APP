class AddPicUrLtoProducts < ActiveRecord::Migration
  
  def change
     add_column :products, :picurl, :string
  end
  
end
