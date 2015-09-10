json.array!(@chats) do |chat|
  json.extract! chat, :id, :name, :description, :slug, :project_id
  json.url chat_url(chat, format: :json)
end
