class Song < ApplicationRecord
  has_many :notes
  belongs_to :artist, optional: true
  belongs_to :genre, optional: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def note_contents
    notes.map(&:content)
  end

  def note_contents=(contents)
    contents.each do |content|
      notes.build(content: content) unless content.blank?
    end
  end
end
