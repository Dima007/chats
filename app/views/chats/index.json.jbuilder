json.array!(@chats) do |chat|
  json.extract! chat, :id, :name, :user_ids
end
