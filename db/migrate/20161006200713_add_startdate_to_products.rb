# frozen_string_literal: true

class AddStartdateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :Startdate, :date
  end
end
