# frozen_string_literal: true

class RemoveCustomerIdfromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :customer_id
  end
end
