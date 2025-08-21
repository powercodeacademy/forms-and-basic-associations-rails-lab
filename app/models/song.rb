class Song < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :genre, optional: true
  has_many :notes

  def artist_name
    artist&.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    notes.map(&:content)
  end

  def note_contents=(contents)
    contents.each do |content|
      next if content.blank?

      Note.find_or_create_by(content: content, song: self)
    end
  end

end
