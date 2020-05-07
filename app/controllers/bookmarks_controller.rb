class BookmarksController < ApplicationController
  before_action :authenticate_customer!



  def top
    @bookmarks = Bookmark.all #一覧表示するためにBookmarkモデルの情報を全てall

  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @bookmark_comment = BookmarkComment.new
  end

  def index
    @bookmarks = Bookmark.all #一覧表示するためにBookmarkモデルの情報を全てall
    @newbookmark = Bookmark.new
  end

  def create
    @newbookmark = Bookmark.new(bookmark_params) #Bookmarkモデルのテーブルを使用しているのでbookmarkコントローラで保存する。
    @newbookmark.customer_id = current_customer.id
    @customer = current_customer
    if @newbookmark.save #入力されたデータをdbに保存する。
      redirect_to customer_path(@customer.id), notice: "successfully created book!"#保存された場合の移動先を指定。
    else
      @bookmarks = Bookmark.all
      render 'index'
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end


  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: "successfully updated book!"
    else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
      render "edit"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path, notice: "successfully delete book!"
  end



  private
  def bookmark_params
    params.require(:bookmark).permit(:customer_id, :bookmark_name, :bookmark_url, :bookmark_description, :genre_id, :bookmark_image_id, :is_bookmark_status, :bookmark_screenshot_id)
  end



end
