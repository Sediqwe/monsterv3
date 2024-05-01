json.extract! gamelink, :id, :game_id, :link, :linktype_id, :created_at, :updated_at
json.url gamelink_url(gamelink, format: :json)
