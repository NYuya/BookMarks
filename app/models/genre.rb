class Genre < ApplicationRecord
  has_many :bookmarks,dependent: :destroy

  validates :genre_name, presence: true

end
