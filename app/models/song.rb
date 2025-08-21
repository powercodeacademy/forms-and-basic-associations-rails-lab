require 'byebug'
class Song < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :genre, optional: true
  has_many :notes

  def artist_name
    artist&.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    save
  end

  def note_contents
    notes.map(&:content)
  end

  def note_contents=(notes)
    notes.each do |note|
      if note.length > 0
        found_note = Note.find_or_create_by(content: note)
        self.notes << found_note
      end
    end
  end
end
