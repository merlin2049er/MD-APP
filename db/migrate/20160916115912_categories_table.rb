class CategoriesTable < ActiveRecord::Migration
  def change
  end
  
     def up
      drop_table :Categories
     end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
