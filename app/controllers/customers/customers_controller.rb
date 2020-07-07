class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!, except:[:top, :index]
  before_action :baria_customer, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])
    if @customer == current_customer
      @bookmarks = @customer.bookmarks
    else
      @bookmarks = @customer.bookmarks.where(is_bookmark_status: true )
    end

    @newbookmark = Bookmark.new
    @folders = @customer.folders
    @newfolder = Folder.new
  end

  def edit
    @customer = Customer.find(params[:id])
    # if @customer == current_customer
    #   render "edit"      
    # else
    #   redirect_to customer_path(current_customer)
    # end
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
  
  def baria_customer
    @customer = Customer.find(params[:id])
    if current_customer != @customer
      redirect_to customer_path(current_customer)
    end
    
  end

end
