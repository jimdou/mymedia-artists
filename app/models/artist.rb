class Artist < ApplicationRecord

  has_many :artist_similarities
  has_many :similar_artists, through: :artist_similarities

end
