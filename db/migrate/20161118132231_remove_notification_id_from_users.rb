class RemoveNotificationIdFromUsers < ActiveRecord::Migration
  def change
    
     remove_column :Users, :notification_id
  end
end
