class Song < ApplicationRecord
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes 
end
