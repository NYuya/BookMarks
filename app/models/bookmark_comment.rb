class BookmarkComment < ApplicationRecord

  belongs_to :customer
  belongs_to :bookmark
  validates :bookmark_comment, presence: true
  validates :score, numericality:{ greater_than: -0.9 }

end
