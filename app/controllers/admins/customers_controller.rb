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
  end
end
