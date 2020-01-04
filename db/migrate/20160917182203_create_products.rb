# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :title
      t.text    :template
      t.decimal  :price
      t.decimal  :msrp
      t.date    :enddate

      t.timestamps null: false
    end
  end
end
