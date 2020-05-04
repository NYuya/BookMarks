class Folder < ApplicationRecord
  has_many :folder_bookmarks,dependent: :destroy
end
