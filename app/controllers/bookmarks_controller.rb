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
    Bookmark.import(params[:file], current_customer)
    redirect_to customer_path(current_customer)
  end

  def create
    @newbookmark = Bookmark.new(bookmark_params) #Bookmarkモデルのテーブルを使用しているのでbookmarkコントローラで保存する。

    if params[:bookmark][:bookmark_url].blank?
      # @bookmarks = Bookmark.all
      @customer = Customer.find(current_customer.id)
      @folders = @customer.folders
      @newfolder = Folder.new
      # @newbookmark.valid?
      @bookmarks = @customer.bookmarks
        respond_to do |format|
          format.html do
            #html用の処理を書く
          end 
          format.csv do
            #csv用の処理を書く
          end
        end
      
      @newbookmark.save
      render 'customers/customers/show'
      return
    end


    @tittle = @newbookmark.get_tittle(params[:bookmark][:bookmark_url]) #スクレイピング「タイトル」
    @newbookmark.bookmark_name = @tittle

    # @thumbnail = @newbookmark.get_thumbnail(params[:bookmark][:bookmark_url]) #スクレイピング「サムネ画像」
    # @newbookmark.bookmark_image = @thumbnail
    
    @newbookmark.customer_id = current_customer.id
    @customer = current_customer
    if @newbookmark.save #入力されたデータをdbに保存する。
      redirect_to customer_path(@customer.id), notice: "successfully created bookmark!"#保存された場合の移動先を指定。
    else
      @newbookmark.errors.full_messages.each do |msg|
        p msg
      end
      @bookmarks = Bookmark.all
      render 'index'
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



end
