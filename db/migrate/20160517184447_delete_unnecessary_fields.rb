class DeleteUnnecessaryFields < ActiveRecord::Migration
  def change
  	remove_column :chats, :unread_messages_count
  	remove_column :users, :messages_count
  	remove_column :chats, :user_ids
  end
end
