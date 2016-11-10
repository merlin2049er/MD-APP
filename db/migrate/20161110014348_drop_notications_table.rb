class DropNoticationsTable < ActiveRecord::Migration
  def change
     drop_table :notications
  end
end
