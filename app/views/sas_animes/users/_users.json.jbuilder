json.extract! user, :id, :name, :profile, :status, :created_at, :updated_at
json.url sas_animes_user_url(user, format: :json)
