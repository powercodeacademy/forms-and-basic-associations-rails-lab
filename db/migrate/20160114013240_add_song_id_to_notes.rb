class AddSongIdToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :song_id, :integer
  end
end
