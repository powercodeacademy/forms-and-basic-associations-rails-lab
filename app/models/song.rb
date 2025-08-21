class Song < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :genre, optional: true
  has_many :notes

  def artist_name
    artist.name
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def note_contents
    notes.map(&:content)
  end

  def note_contents=(contents)
    contents.each do |content|
      Note.find_or_create_by(content: content, song: self)
    end
  end
end
