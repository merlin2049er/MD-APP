class AddProcessingToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :processing, :boolean, :default => false

  end
end
