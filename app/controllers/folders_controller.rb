class FoldersController < ApplicationController

  def create
  	@newfolder = Folder.new(folder_params)
  	@newfolder.customer_id = current_customer.id
    @customer = current_customer
    if @newfolder.save #入力されたデータをdbに保存する。
      redirect_to customer_path(@customer.id), notice: "successfully created folder!"#保存された場合の移動先を指定。
    else
      @folders = Folder.all
      render 'index'
    end
  end


def update
    @folder = Folder.find(params[:id])
    if @folder.update(folder_params)
      redirect_to customer_path(@customer.id), notice: "successfully updated folder!"
    else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
      render "edit"
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy
    @customer = current_customer
    redirect_to customer_path(@customer.id), notice: "successfully delete folder!"
  end


  private
  def folder_params
    params.require(:folder).permit(:customer_id, :bookmark_id, :folder_name, :pearent_folder_id)
  end

end
