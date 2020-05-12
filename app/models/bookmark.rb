class Bookmark < ApplicationRecord

  belongs_to :customer
  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  #presence trueは空欄の場合を意味する。
  
  has_many :bookmark_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	# has_many :folder_bookmark_relations
  belongs_to :folder
	
	attachment :bookmark_image


  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end



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

end
