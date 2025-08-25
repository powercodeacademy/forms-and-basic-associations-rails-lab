class Song < ApplicationRecord
  belongs_to :artist, optional: true

  def artist_name
    artist&.name
    # artist ? artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
end
