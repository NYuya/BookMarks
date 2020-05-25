class Folder < ApplicationRecord

  belongs_to :customer

  # has_many :folder_bookmark_relations
  has_many :bookmarks # , through: :folder_bookmark_relations

	validates :folder_name, presence: true


end
