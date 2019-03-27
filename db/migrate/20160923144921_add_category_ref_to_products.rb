# frozen_string_literal: true

class AddCategoryRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :category, index: true, foreign_key: true
  end
end
