class FolderBookmark < ApplicationRecord

  belongs_to :customer
  belongs_to :folder
  has_many :bookmarks,dependent: :destroy


end
