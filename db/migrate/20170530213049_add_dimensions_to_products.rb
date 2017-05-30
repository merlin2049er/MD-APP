class AddDimensionsToProducts < ActiveRecord::Migration
  def change

    add_column :products, :length, :integer
    add_column :products, :width, :integer
    add_column :products, :height, :integer
    add_column :products, :weight, :integer

    add_column :products, :courier, :string
    add_column :products, :courierurl, :string

  end
end
