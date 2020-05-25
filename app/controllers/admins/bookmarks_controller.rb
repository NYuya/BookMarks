class Admins::BookmarksController < ApplicationController

  before_action :authenticate_admin!

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
