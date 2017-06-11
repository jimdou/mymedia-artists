json.extract! artist_similarity, :id, :artist_id, :similar_artist_id, :created_at, :updated_at
json.url artist_similarity_url(artist_similarity, format: :json)