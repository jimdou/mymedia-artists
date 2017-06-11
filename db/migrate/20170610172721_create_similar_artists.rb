class CreateSimilarArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :similar_artists do |t|
      t.string :name
      t.string :description
      t.string :genre
      t.string :image
      t.datetime :birthDate
      t.datetime :deathDate
      t.datetime :activeFrom
      t.datetime :activeUntil
      t.integer :artist_id

      t.timestamps
    end
  end
end
