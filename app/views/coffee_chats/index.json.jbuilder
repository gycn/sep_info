json.array!(@coffee_chats) do |coffee_chat|
  json.extract! coffee_chat, :id
  json.url coffee_chat_url(coffee_chat, format: :json)
end
