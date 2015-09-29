json.array!(@memberinvites) do |memberinvite|
  json.extract! memberinvite, :id, :email, :account_id, :sender_id, :receiver_id, :token
  json.url memberinvite_url(memberinvite, format: :json)
end
