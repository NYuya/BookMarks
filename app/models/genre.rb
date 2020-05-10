class Genre < ApplicationRecord

  belongs_to :customer

  # has_many :bookmarks,dependent: :destroy

  validates :genre_name, presence: true

end
