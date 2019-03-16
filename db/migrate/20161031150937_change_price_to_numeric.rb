# frozen_string_literal: true

class ChangePriceToNumeric < ActiveRecord::Migration
  def change
    change_column :products, :price, :decimal, precision: 8, scale: 2
  end
end
