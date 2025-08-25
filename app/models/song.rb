class Song < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :genre, optional: true
  has_many :notes
end
