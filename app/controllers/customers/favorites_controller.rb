class Customers::FavoritesController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    # @bookmarks = Bookmark.where(customer_id: @customer.id).all
    @favorites = @customer.favorites
  end


end
