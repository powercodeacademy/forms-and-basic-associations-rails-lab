class Song < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :genre, optional: true
  has_many :notes

  def artist_name
    artist&.name
    # artist ? artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.map(&:content)
    # self.notes.map { |note| note.content }
  end

  def note_contents=(contents)
    contents.each do |content|
      next if content.blank?

      self.notes << Note.create(content: content)
    end
  end
end
