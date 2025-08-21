class Song < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :genre, optional: true

  def artist_name
    artist&.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
end
