class ArtistSimilarity < ApplicationRecord
  belongs_to :artist
  belongs_to :similar_artist
end
