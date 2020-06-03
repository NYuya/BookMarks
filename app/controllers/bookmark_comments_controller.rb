class BookmarkCommentsController < ApplicationController

  def index
  end

  def edit
  end

  def update
  end

  def create
    bookmark = Bookmark.find(params[:bookmark_id])
    comment = current_customer.bookmark_comments.new(bookmark_comment_params)
    comment.bookmark_id = bookmark.id
    comment.score = Language.get_data(bookmark_comment_params[:bookmark_comment])
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    bookmark_comment = BookmarkComment.find(params[:bookmark_comment_id])
    bookmark_comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def bookmark_comment_params
      params.require(:bookmark_comment).permit(:bookmark_comment)
  end

end
