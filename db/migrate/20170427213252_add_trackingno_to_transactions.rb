class AddTrackingnoToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :tracking_number, :string

  end
end
