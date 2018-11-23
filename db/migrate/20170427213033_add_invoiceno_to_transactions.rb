# frozen_string_literal: true

class AddInvoicenoToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :invoice_number, :string
  end
end
