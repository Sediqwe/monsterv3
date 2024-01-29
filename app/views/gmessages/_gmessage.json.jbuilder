json.extract! gmessage, :id, :user_id, :desc, :title, :game_id, :gmessage_id, :warn, :senduser_id, :created_at, :updated_at
json.url gmessage_url(gmessage, format: :json)
json.desc gmessage.desc.to_s
