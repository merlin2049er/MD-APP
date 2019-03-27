# frozen_string_literal: true

class AddPicUrlToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :picurl, :string
  end
end
