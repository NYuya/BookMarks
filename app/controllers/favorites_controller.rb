class FavoritesController < ApplicationController

  def create
    @bookmark = Bokmark.find(params[:bookmark_id])
        favorite = current_customer.favorites.new(bookmark_id: @bookmark.id)
        favorite.save
  end

  def destroy
    @bookmark = Bokmark.find(params[:bookmark_id])
        favorite = current_customer.favorites.find_by(bookmark_id: @bookmark.id)
        favorite.destroy
  end

end
