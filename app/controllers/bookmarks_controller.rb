require 'open-uri'
require 'nokogiri'

class BookmarksController < ApplicationController



  before_action :authenticate_customer!, except:[:top, :index, :show]

  def top
    @bookmarks = Bookmark.all #一覧表示するためにBookmarkモデルの情報を全てall
  end

  def index
    @bookmarks = Bookmark.all #一覧表示するためにBookmarkモデルの情報を全てall
    @newbookmark = Bookmark.new
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @bookmark_comment = BookmarkComment.new
  end

  def import
    if params[:file].nil?
      redirect_to  customer_path(current_customer)
    else
      Bookmark.import(params[:file], current_customer)
      redirect_to customer_path(current_customer)
    end
  end

  def create
    @newbookmark = Bookmark.new(bookmark_params) #Bookmarkモデルのテーブルを使用しているのでbookmarkコントローラで保存する。  
    
    tittle = get_tittle(params[:bookmark][:bookmark_url]) #スクレイピング「タイトル」 private method
    @newbookmark.bookmark_name = tittle

    @newbookmark.customer_id = current_customer.id
    @customer = current_customer
    if @newbookmark.save #入力されたデータをdbに保存する。
      redirect_to customer_path(@customer.id), notice: "successfully created bookmark!"#保存された場合の移動先を指定。
    else
      @newbookmark.errors.full_messages.each do |msg|
        p msg
      end
      @folders = @customer.folders
      @newfolder = Folder.new
      @bookmarks = current_customer.bookmarks
      render 'customers/customers/show'
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @folders = current_customer.folders
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: "successfully updated bookmark!"
    else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
      render "edit"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @customer = current_customer
    @bookmark.destroy
    redirect_to @customer, notice: "successfully delete bookmark!"
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:customer_id, :bookmark_name, :bookmark_url, :bookmark_description, :genre_id, :folder_id, :bookmark_image, :is_bookmark_status, :bookmark_screenshot_id)
  end

  # bookmark_nameスクレイピングーーーーー↓
	def get_tittle(url)

		begin
			charset = nil
				html = open(url) do |f|
					charset = f.charset # 文字種別を取得
					f.read # htmlを読み込んで変数htmlに渡す
				end

			doc = Nokogiri::HTML.parse(html, nil, charset)# htmlをパース(解析)してオブジェクトを生成
			p doc.title# タイトルを表示
			doc.title

		rescue => error
      # errors.add(:bookmark_url, "の内容が不正です")
      return ""
		end

	end
  # bookmark_nameスクレイピングーーーーー↑

end
