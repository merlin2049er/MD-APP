class AddShippedToTransactions < ActiveRecord::Migration
  def change

    add_column :transactions, :shipped, :boolean

  end
end
