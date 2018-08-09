class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "customer_id"

      t.timestamps null: false
    end
  end
end
