json.array!(@participations) do |participation|
  json.extract! participation, :id, :role_id, :user_id, :project_id
  json.url participation_url(participation, format: :json)
end
