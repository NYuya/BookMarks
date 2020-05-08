class Admins::BookmarksController < ApplicationController
  def index
  	@bookmarks = Bookmark.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
