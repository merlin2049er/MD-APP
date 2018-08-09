class AddColumnsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :registered_user, :boolean
    add_column :contacts, :supplier, :boolean
  end
end
