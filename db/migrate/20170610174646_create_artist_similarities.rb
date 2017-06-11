class CreateArtistSimilarities < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_similarities do |t|
      t.references :artist, foreign_key: true
      t.references :similar_artist, foreign_key: true

      t.timestamps
    end
  end
end
