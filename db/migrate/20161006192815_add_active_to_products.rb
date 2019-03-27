# frozen_string_literal: true

class AddActiveToProducts < ActiveRecord::Migration
  def change
    add_column :products, :active, :boolean
  end
end
