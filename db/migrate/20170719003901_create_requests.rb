class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :product
      t.string :producturl
      t.string :manufacturer
      t.boolean :enabled

      t.timestamps null: false
    end
  end
end
