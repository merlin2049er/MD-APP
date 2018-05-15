class FixColumnName < ActiveRecord::Migration

  def change
    rename_column :products, :Startdate, :startdate
  end
end
