# frozen_string_literal: true

class AddProductIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :product_id, :integer
  end
end
