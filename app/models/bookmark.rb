class Bookmark < ApplicationRecord

	belongs_to :customer
	belongs_to :folder, optional: true	#folderが指定されてなくてもブックマークできるようにするため

  has_many :bookmark_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	
	attachment :bookmark_image

	validates :bookmark_description, length: { maximum: 50 }
	validates :bookmark_url, presence: true
	validate :get_tittle
	

	
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



# bookmark_nameスクレイピングーーーーー↓

	require 'open-uri'
	require 'nokogiri'

	def get_tittle
		begin
		url = self.bookmark_url
		charset = nil
		html = open(url) do |f|
			charset = f.charset # 文字種別を取得
			f.read # htmlを読み込んで変数htmlに渡す
		end

		
			doc = Nokogiri::HTML.parse(html, nil, charset)# htmlをパース(解析)してオブジェクトを生成
			p doc.title# タイトルを表示
			doc.title
	
		rescue => error
			errors.add(:bookmark_url, "の内容が不正です")
		end
		# doc = Nokogiri::HTML.parse(html, nil, charset)# htmlをパース(解析)してオブジェクトを生成
		# p doc.title# タイトルを表示
		# doc.title
	end
# bookmark_nameスクレイピングーーーーー↑

# bookmark_imageスクレイピングーーーーー↓
	# require 'open-uri'
	# require 'nokogiri'

	# def get_thumbnail(url)

	# 	charset = nil
	# 	html = open(url) do |f|
	# 		charset = f.charset # 文字種別を取得
	# 		f.read # htmlを読み込んで変数htmlに渡す
	# 	end

	# 	# htmlをパース(解析)してオブジェクトを生成
	# 	doc = Nokogiri::HTML.parse(html, nil, charset)
		
	# 	doc.xpath('//li[@class="BookMark-thumbnail"]').each do |node|

	# 	p node.css('img').attribute('src').value	# サムネイル画像
	# 	p node.css('a').attribute('href').value	# サムネイル画像
		
	# 	end
	# end
# bookmark_imageスクレイピングーーーーー↑

end
