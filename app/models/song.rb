class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    artist.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    save
  end
end
