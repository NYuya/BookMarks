class Bookmark < ApplicationRecord

  belongs_to :customer
  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  #presence trueは空欄の場合を意味する。

  has_many :bookmark_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

end
