# frozen_string_literal: true

class AddInvoiceToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :invoice, :string
  end
end
