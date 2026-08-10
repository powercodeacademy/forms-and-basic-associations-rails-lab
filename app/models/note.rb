class Note < ApplicationRecord
  belongs_to :song, optional: true

end
