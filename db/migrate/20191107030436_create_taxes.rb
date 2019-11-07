class CreateTaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :taxes do |t|
      t.string  :prov_id, unique: true
      t.float   :tax_rate
      t.boolean :enabled
      t.string  :comment

      t.timestamps
    end
  end
end
