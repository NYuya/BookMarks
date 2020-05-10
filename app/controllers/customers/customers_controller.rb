class Customers::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @bookmarks = @customer.bookmarks
    @newbookmark = Bookmark.new

    @genres = @customer.genres
    @newgenre = Genre.new

    @folders = @customer.folders
    @newfolder = Folder.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer), notice: "successfully updated customer!"
    else
      render :edit
    end
  end

  def confirm
  end

  def hide
    #is_member_statusカラムにフラグを立てる(defaultはfalse)
    current_customer.update(is_customer_status: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:customer_name,:customer_introduction,:is_customer_status,:customer_image)
  end
end
