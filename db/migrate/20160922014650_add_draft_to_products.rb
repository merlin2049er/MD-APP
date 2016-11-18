class AddDraftToProducts < ActiveRecord::Migration
  def change
    add_column :products, :draft, :boolean
  end
end
