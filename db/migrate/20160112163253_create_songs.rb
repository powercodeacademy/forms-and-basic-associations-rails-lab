class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.references :artist, foreign_key: true
      t.references :genre, foreign_key: true
      t.timestamps null: false
    end
  end
end
