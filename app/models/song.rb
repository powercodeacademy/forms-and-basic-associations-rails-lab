class Song < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :genre, optional: true
  has_many :notes
  validates :title, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist&.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    genre&.name
  end

  def note_contents=(contents)
    contents.each do |content|
      notes.build(content: content) if content.strip != ''
    end
  end

  def note_contents
    notes.map(&:content)
  end
end
