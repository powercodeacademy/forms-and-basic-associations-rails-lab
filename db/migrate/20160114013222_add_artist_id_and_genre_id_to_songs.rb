class AddArtistIdAndGenreIdToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :artist_id, :integer
    add_column :songs, :genre_id, :integer
  end
end
