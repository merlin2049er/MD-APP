# frozen_string_literal: true

class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def change
    change_table :products do |t|
     # t.change :price, :decimal, precision: 8, scale: 2
     # t.change :msrp, :decimal
    end
  end
end
