# frozen_string_literal: true

class AddDraftToProducts < ActiveRecord::Migration
  def change
    add_column :products, :draft, :boolean
  end
end
