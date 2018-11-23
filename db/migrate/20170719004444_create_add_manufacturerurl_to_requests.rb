# frozen_string_literal: true

class CreateAddManufacturerurlToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :manufacturerurl, :string
  end
end
