# frozen_string_literal: true

class CreateProductsUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :product_users, id: false do |t|
      t.integer :product_id
      t.integer :user_id
    end
    add_index :product_users, %i[product_id user_id]
  end

  def self.down
    drop_table :product_users
  end
end
