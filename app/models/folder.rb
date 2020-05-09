class Folder < ApplicationRecord

  belongs_to :customer
  # has_many :bookmarks,dependent: :destroy
  has_many :folder_bookmarks,dependent: :destroy

end
