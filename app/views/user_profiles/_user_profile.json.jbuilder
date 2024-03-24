json.extract! user_profile, :id, :user_id, :profile_id, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
