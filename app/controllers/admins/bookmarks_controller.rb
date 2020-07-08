class Admins::BookmarksController < ApplicationController

  before_action :authenticate_admin!

  def index
  	@bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to admins_bookmarks_path, notice: "successfully delete bookmark!"
  end

end
