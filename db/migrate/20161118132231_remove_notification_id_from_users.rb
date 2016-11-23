class RemoveNotificationIdFromUsers < ActiveRecord::Migration
  def change
    
     remove_column :users, :notification_id
  end
end
