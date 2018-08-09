class RemoveCustomerIdfromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :customer_id
  end
end
