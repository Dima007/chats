class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :name
      t.string :user_ids
      t.integer :unread_messages_count, default: 0

      t.timestamps null: false
    end
  end
end
