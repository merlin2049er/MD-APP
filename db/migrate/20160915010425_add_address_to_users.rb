# frozen_string_literal: true

class AddAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postal, :string
  end
end
