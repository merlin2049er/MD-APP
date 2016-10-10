class AddNotificationRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :notification, index: true, foreign_key: true
  end
end
