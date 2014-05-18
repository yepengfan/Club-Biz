json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :contents
  json.url tweet_url(tweet, format: :json)
end
