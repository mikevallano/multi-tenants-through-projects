json.array!(@invites) do |invite|
  json.extract! invite, :id, :email, :account_id, :project_ids, :role_ids, :sender_id, :receiver_id, :token
  json.url invite_url(invite, format: :json)
end
