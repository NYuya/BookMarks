class FolderBookmark < ApplicationRecord

  belongs_to :customer
  belongs_to :folder
  belongs_to :bookmark

end
