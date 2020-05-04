class Bookmark < ApplicationRecord

  attachment :image
  belongs_to :customer
  belongs_to :genre
  belongs_to :folder_bookmark


  has_many :bookmark_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  validates :bookmark_name, presence: true
  validates :bookmark_description, presence: true, length: {maximum: 200}




end
