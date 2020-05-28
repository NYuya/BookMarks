class Bookmark < ApplicationRecord

	belongs_to :customer
	belongs_to :folder, optional: true	#folderが指定されてなくてもブックマークできるようにするため

  has_many :bookmark_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	
	attachment :bookmark_image

	validates :bookmark_description, length: { maximum: 50 }
	validates :bookmark_url, presence: true
	validates :bookmark_url, format: URI::regexp(%w(http https))
	

	
	def favorited_by?(customer)
		favorites.where(customer_id: customer.id).exists?
	end



# bookmarkインポートーーーーー↓
	def self.import(file, current_customer)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      bookmark = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
			bookmark.attributes = row.to_hash.slice(*updatable_attributes)
			bookmark.customer_id = current_customer.id
			# 保存する
      bookmark.save
    end
	end
	
  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["bookmark_name", "bookmark_url", "bookmark_description"]
	end
# bookmarkインポートーーーーー↑

end
