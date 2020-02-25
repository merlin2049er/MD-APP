class AddPaidToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :paid, :boolean
  end
end
