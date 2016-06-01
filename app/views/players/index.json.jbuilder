json.array!(@players) do |player|
  json.extract! player, :id, :email, :high_score
  json.url player_url(player, format: :json)
end
