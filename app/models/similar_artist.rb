class SimilarArtist < ApplicationRecord

  has_many :artist_similarities
  has_many :artists, through: :artist_similarities

end
