class Song < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :genre, optional: true
  has_many :notes 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name 
    self.artist ? self.artist.name : nil 
  end
  
end
