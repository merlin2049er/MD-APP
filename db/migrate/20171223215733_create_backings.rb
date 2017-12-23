class CreateBackings < ActiveRecord::Migration
  def change
    create_table :backings do |t|
      t.integer :qty
      t.references :user
      t.references :product

      t.timestamps null: false
    end
  end
end
