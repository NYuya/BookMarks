class Bookmark < ApplicationRecord

  belongs_to :customer
  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  #presence trueは空欄の場合を意味する。
  
  has_many :bookmark_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	# has_many :folder_bookmark_relations
	belongs_to :folder, optional: true	#folderが指定されてなくてもブックマークできるようにするため
	
	attachment :bookmark_image


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

	def get_tittle(url)

	# スクレイピング先のURL
	# url = 'https://coinmarketcap.com/'

	charset = nil
	html = open(url) do |f|
	  charset = f.charset # 文字種別を取得
	  f.read # htmlを読み込んで変数htmlに渡す
	end

	# htmlをパース(解析)してオブジェクトを生成
	doc = Nokogiri::HTML.parse(html, nil, charset)

	# タイトルを表示
	p doc.title
	doc.title
	end
# bookmark_nameスクレイピングーーーーー↑

# bookmark_imageスクレイピングーーーーー↓

	require 'open-uri'
	require 'nokogiri'

	def get_thumbnail(url)

		charset = nil
		html = open(url) do |f|
			charset = f.charset # 文字種別を取得
			f.read # htmlを読み込んで変数htmlに渡す
		end

		# htmlをパース(解析)してオブジェクトを生成
		doc = Nokogiri::HTML.parse(html, nil, charset)
		
		doc.xpath('//li[@class="BookMark-thumbnail"]').each do |node|

		p node.css('img').attribute('src').value	# サムネイル画像
		p node.css('a').attribute('href').value	# サムネイル画像
		
		end

	end
# bookmark_imageスクレイピングーーーーー↑

end
