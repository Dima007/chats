class AddDefaultValueToMessagesCountInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :messages_count, :integer, default: 0
  end
end
