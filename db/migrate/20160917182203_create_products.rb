# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :title
      t.text    :template
      t.string  :price
      t.string  :msrp
      t.date    :enddate

      t.timestamps null: false
    end
  end
end
