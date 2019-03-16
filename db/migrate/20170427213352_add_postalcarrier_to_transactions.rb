# frozen_string_literal: true

class AddPostalcarrierToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :postal_carrier, :string, limit: 3
  end
end
