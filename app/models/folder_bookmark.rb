class FolderBookmark < ApplicationRecord
  has_many :bookmarks,dependent: :destroy

  belongs_to :folder

end
