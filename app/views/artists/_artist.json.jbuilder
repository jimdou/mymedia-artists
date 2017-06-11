json.extract! artist, :id, :name, :description, :genre, :image, :birthDate, :deathDate, :activeFrom, :activeUntil, :created_at, :updated_at
json.url artist_url(artist, format: :json)

json.similar_artists artist.similar_artists.order(name: :asc), partial: 'similar_artists/similar_artist', as: :similar_artist
