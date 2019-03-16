# frozen_string_literal: true

class AddShippedToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :shipped, :boolean
  end
end
