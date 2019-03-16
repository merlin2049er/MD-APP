# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notify_msg

      t.timestamps null: false
    end
  end
end
