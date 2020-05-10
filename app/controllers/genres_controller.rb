class GenresController < ApplicationController
  
  def create
    @newgenre = Genre.new(genre_params)
    @customer = current_customer
  	if @newgenre.save
  		redirect_to customer_path(@customer.id),  notice: "successfully created Genre!"
  	else
  		@genres = Genres.all
  		render customer_path(@customer.id)
  	end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @customer = current_customer
    @genre.destroy
    redirect_to customer_path(@customer.id), notice: "successfully delete genre!"
  end

  def update
    @genre = Genre.find(params[:id])
    @customer = current_customer
    @genre.update(genre_params)
    redirect_to customer_path(@customer.id), notice: "successfully created Genre!"
  end


  private
  def genre_params
    params.require(:genre).permit(:genre_name, :is_active)
  end


end
