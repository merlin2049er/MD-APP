# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      # add connection to user id here...
      t.string :transaction_msg
      t.timestamps null: false
    end
  end
end
