class Admins::CustomersController < ApplicationController

  before_action :authenticate_admin!
  
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @bookmarks = @customer.bookmarks
    @folders = @customer.folders
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admins_customers_path
  end
  


  private

  def customer_params
    params.require(:customer).permit(:customer_name,:customer_introduction,:is_customer_status,:customer_image)
  end

  # def baria_customer
  #   @customer = Customer.find(params[:id])
  # 	if current_customer != @customer
  # 		redirect_to customer_path(current_customer)
  # 	end
  #  end
end
