class BookmarkComment < ApplicationRecord

  belongs_to :customer
  belongs_to :bookmark
  validates :bookmark_comment, presence: true

end
